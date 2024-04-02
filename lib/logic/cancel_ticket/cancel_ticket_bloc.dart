import 'package:bus_iraq2/data/repository/ticket/ticket_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'cancel_ticket_state.dart';

class CancelTicketBloc extends Cubit<CancelTicketState> {
  CancelTicketBloc({required this.cancelTicketRepoImp}) : super(const CancelTicketState.initial());

  static CancelTicketBloc of(BuildContext context) => BlocProvider.of<CancelTicketBloc>(context);


  final TicketRepoImp cancelTicketRepoImp;

  cancel({required String ticketId}) async {
    try {
      emit(const CancelTicketState.loading());
      final result = await cancelTicketRepoImp.cancel_ticket(ticketId: ticketId);
      result.fold(
        (l) {
          debugPrint('================= CancelTicket Bloc : ${KFailure.toError(l)}');
          emit(CancelTicketState.error(error: l));
        },
        (r) {
          debugPrint('================= CancelTicket Bloc : ${r.toString()}  ');
          emit(const CancelTicketState.success());
        },
      );
    } catch (e) {
      debugPrint('================= CancelTicket Bloc (Catch): ${e.toString()} ');
      emit(const CancelTicketState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
