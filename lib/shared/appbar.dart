// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../shared/theme/text_theme.dart';
// import '../app.dart';
// import '../di.dart';
// import '../logic/logout/logout_bloc.dart';
// import '../logic/logout/logout_state.dart';
// import 'localization/trans.dart';
// import 'widgets/action_dialog.dart';
// import 'widgets/nav.dart';
//
// class KAppBar extends StatefulWidget implements PreferredSizeWidget {
//   const KAppBar({Key? key, this.title = '', this.isMainScreen = false})
//       : super(key: key);
//   final String title;
//   final bool isMainScreen;
//
//   @override
//   State<KAppBar> createState() => _KAppBarState();
//
//   @override
//   Size get preferredSize => const Size.fromHeight(50);
// }
//
// class _KAppBarState extends State<KAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     // bool? isOnline;
//     return Hero(
//       tag: 'appBar',
//       child: AppBar(
//         title: Text(
//           widget.title,
//           style: KTextStyle.of(context).twenty,
//         ),
//         centerTitle: true,
//         // titleTextStyle: KTextStyle.of(context).appBar,
//
//         // leading: SwitchListTile.adaptive(
//         //   value: true,
//         //   onChanged: (value) {},
//         //   title: const Text('data', style: TextStyle(color: Colors.red)),
//         //   applyCupertinoTheme: true,
//         // ),
//
//         leadingWidth: 100,
//         automaticallyImplyLeading: true,
//         elevation: .5,
//
//         actions: [
//           if (widget.isMainScreen)
//             BlocProvider(
//               create: (context) => Di.logOut,
//               child: BlocConsumer<LogoutBloc, LogoutState>(
//                 listener: (context, state) {
//                   state.whenOrNull(
//                     success: () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (_) => const Wrapper()));
//                     },
//                   );
//                 },
//                 builder: (context, state) {
//                   return IconButton(
//                     onPressed: () {
//                       ActionDialog(
//                         title:Tr.get.log_out,
//                         approveAction: Tr.get.yes_message,
//                         cancelAction: Tr.get.no_message,
//                         onApproveClick: () {
//                           LogoutBloc.of(context).logout();
//                         },
//                         onCancelClick: () {
//                           Nav.back();
//                         },
//                       ).show<void>(context);
//                     },
//                     icon: const Icon(Icons.login_outlined),
//                   );
//                 },
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
