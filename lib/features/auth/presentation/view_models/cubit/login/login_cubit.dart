import 'package:elearning/features/auth/data/model/login_request.dart';
import 'package:elearning/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {

  LoginCubit(this._repository): super(LoginStates());

  AuthRepository _repository;

  void changeEmail(String email){
    emit(state.copyWith(LoginStatus.changeEmail, email: email));
  }

  void changePassword(String password){
    emit(state.copyWith(LoginStatus.changePassword, password: password));
  }

  Future<void> login() async{
    emit(state.copyWith(LoginStatus.loadingLogin));
      final response = await _repository.login(LoginRequest(email: state.email, password: state.password));
      response.fold(
        (failure) => emit(state.copyWith(LoginStatus.failedLogin, errorMessage: failure.errorMessage)),
        (user) async {
          await _repository.saveUserName(user.name ?? '');
          emit(state.copyWith(LoginStatus.successLogin, ));
        }
      );
  }
}