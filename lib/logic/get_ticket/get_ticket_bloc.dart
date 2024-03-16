import 'package:bus_iraq2/data/repository/ticket/ticket_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'get_ticket_state.dart';

class GetTicketBloc extends Cubit<GetTicketState> {
  GetTicketBloc({required this.getTicketRepoImp}) : super(const GetTicketState.initial());

  static GetTicketBloc of(BuildContext context) => BlocProvider.of<GetTicketBloc>(context);


  final TicketRepoImp getTicketRepoImp;

  get() async {
    try {
      emit(const GetTicketState.loading());
      final result = await getTicketRepoImp.get_ticket_history();
      result.fold(
        (l) {
          debugPrint('================= GetTicket Bloc : ${KFailure.toError(l)}');
          emit(GetTicketState.error(error: l));
        },
        (r) {
          debugPrint('================= GetTicket Bloc : ${r.toString()}  ');
          emit(GetTicketState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= GetTicket Bloc (Catch): ${e.toString()} ');
      emit(const GetTicketState.error(error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }
}
