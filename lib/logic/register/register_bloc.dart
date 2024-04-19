import 'package:bus_iraq2/data/repository/auth/auth_repo.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/error/failures.dart';
import 'register_state.dart';

class RegisterBloc extends Cubit<RegisterState> {
  RegisterBloc({required this.registerRepoImp})
      : super(const RegisterState.initial());

  static RegisterBloc of(BuildContext context) =>
      BlocProvider.of<RegisterBloc>(context);

  final AuthRepoImpl registerRepoImp;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  CountryCode countryCode = CountryCode(code: 'IQ', dialCode: '+964');

  register() async {
    try {
      emit(const RegisterState.loading());
      final result = await registerRepoImp.register(
        username: userNameController.text,
        phone: phoneController.text,
        password: passController.text,
        address: addressController.text,
        countryCode: countryCode, email: emailController.text,
        firstName: firstNameController.text,
        lastname: lastNameController.text,
      );
      result.fold(
        (l) {
          debugPrint(
              '================= Register Bloc : ${KFailure.toError(l)}');
          emit(RegisterState.error(error: l));
        },
        (r) {
          debugPrint('================= Register Bloc : ${r.toString()}  ');
          emit(RegisterState.success(model: r));
        },
      );
    } catch (e) {
      debugPrint('================= Register Bloc (Catch): ${e.toString()} ');
      emit(const RegisterState.error(
          error: KFailure.someThingWrongPleaseTryAgain()));
    }
  }

  bool isVisible = true;

  togglePassV() {
    isVisible = !isVisible;
    emit(const RegisterState.loading());
    emit(const RegisterState.initial());
  }
}
