import 'dart:typed_data';

import 'package:bus_iraq2/shared/extensions.dart';
import 'package:bus_iraq2/shared/theme/colors.dart';
import 'package:bus_iraq2/shared/theme/text_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:printing/printing.dart';

import '../../../data/model/get_ticket_model.dart';
import '../../../shared/constants.dart';
import '../../../shared/theme/helper.dart';

Future<Uint8List> makePdf({required TicketInnerData ticket}) async {
  // debugPrint("makePdf");
  final font = await rootBundle.load("assets/fonts/URW-DIN-Arabic.ttf");
  final ttf = pw.Font.ttf(font);
  final pdf = pw.Document();
  final textStyle = pw.TextStyle(font: ttf);
  final imageLogo = pw.MemoryImage((await rootBundle.load(
    Constant.appLogo,
  ))
      .buffer
      .asUint8List());
  pdf.addPage(
    pw.Page(
      // pageTheme: pw.PageTheme(buildBackground:(context) => pw.Container(color:PdfColors.blueGrey50,width: double.infinity), ),

      build: (context) {
        return pw.Column(
          children: [
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.SizedBox(
                  height: 150,
                  width: 150,
                  child: pw.Image(imageLogo),
                ),
                pw.Text("باص العراق",
                    style: textStyle.copyWith(fontSize: 20),
                    textDirection: pw.TextDirection.rtl),
              ],
            ),
            pw.SizedBox(height: 30),
            pw.Container(
              padding:
                  const pw.EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColor.fromHex("#125878"))),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text("رقم الحجز:  ${ticket.pnrNumber ?? ''}",
                      style: textStyle.copyWith(fontSize: 20),
                      textDirection: pw.TextDirection.rtl),
                  pw.SizedBox(height: 15),
                  pw.Text("اسم الراكب:  ${ticket.user ?? ''}",
                      style: textStyle.copyWith(fontSize: 20),
                      textDirection: pw.TextDirection.rtl),
                  pw.SizedBox(height: 15),
                  pw.Divider(),
                  pw.SizedBox(height: 15),
                  pw.Text(
                      " مبلغ الحجز : "
                      "${double.parse(ticket.subTotal ?? '0')} دينار",
                      style: textStyle.copyWith(
                          fontSize: 20, color: PdfColors.blue),
                      textDirection: pw.TextDirection.rtl),

                ],
              ),
            ),
            // pw.SizedBox(height: 15),
            //
            // pw.Text("بغداد-كربلاء",
            //     style: textStyle.copyWith(fontSize: 20),
            //     textDirection: pw.TextDirection.rtl),
            pw.Spacer(),
            pw.Text("شكرا لاستخدامك باص العراق",
                style: textStyle.copyWith(fontSize: 20),
                textDirection: pw.TextDirection.rtl),
          ],
        );
      },
    ),
  );
  return pdf.save();
}

Future PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) async {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Text(
      text,
      textAlign: align,
    ),
  );
}

class PdfPreviewPage extends StatelessWidget {
  const PdfPreviewPage({
    Key? key,
    required this.ticket,
  }) : super(key: key);
  final TicketInnerData ticket;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('سحب التذكره'),
      ),
      body: PdfPreview(

        build: (context) => makePdf(ticket: ticket),
      ),
    );
  }
}
