import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../data/dtos/dtos.dart';
import '../../domain/services/services.dart';

part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  Future<void> onLogin(LoginPayloadDto payload) async {
    emit(const LoginLoading());

    print(payload);

    emit(const LoginSuccess('test token'));
  }
}
