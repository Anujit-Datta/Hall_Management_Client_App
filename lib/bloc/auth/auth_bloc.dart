import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hall_management_client/data/models/network_response.dart';
import 'package:hall_management_client/data/utils/network_caller.dart';
import 'package:hall_management_client/data/utils/urls.dart';
import 'package:hall_management_client/data/utils/user_auth_controller.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial(isObscure: true)) {
    on<PassObscureToggleEvent>((event, emit) {
      (state as AuthInitial).isObscure
          ? emit(AuthInitial(isObscure: false))
          : emit(AuthInitial(isObscure: true));
    });

    on<LoginEvent>((event, emit) async {
      EasyLoading.show(status: 'Please wait');
      NetworkResponse response = await NetworkCaller.postRequest(
        url: Urls.login,
        body: {"email": event.email, "password": event.password},
      );
      if(response.isSuccess){
        await AuthController.setToken(response.responseData['result']['data']['token']);
        log(response.responseData["result"]["data"]["token"]);
        EasyLoading.dismiss();
        EasyLoading.showSuccess(response.responseData['result']['message']);
        emit(LoggedInState());
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(response.responseData['result']['message']);
        emit(LoginErrorState(response.responseData['result']['message']));
      }
    });
  }
}
