import 'package:elearning/features/auth/data/model/signup_request.dart';
import 'package:elearning/features/auth/data/repository/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates> {

  SignupCubit(this._repository): super(SignupStates());

  AuthRepository _repository;

  void changeFullName(String fullName){
    emit(state.copyWith(SignupStatus.changeFullName, fullName: fullName));
  }

  void changeEmail(String email){
    emit(state.copyWith(SignupStatus.changeEmail, email: email));
  }

  void changePassword(String password){
    emit(state.copyWith(SignupStatus.changePassword, password: password));
  }

  Future<void> signup() async{
    emit(state.copyWith(SignupStatus.loadingSignup));
      final response = await _repository.signup(
        SignupRequest(fullName: state.fullName, email: state.email, password: state.password)
      );
      response.fold(
        (failure) => emit(state.copyWith(SignupStatus.failedSignup, errorMessage: failure.errorMessage)),
          (user) => emit(state.copyWith(SignupStatus.successSignup, ))
      );
  }
}