import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:elearning/core/shared/errors/failure.dart';
import 'package:elearning/features/auth/data/model/login_request.dart';
import 'package:elearning/features/auth/data/model/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:elearning/features/auth/data/model/signup_request.dart';
import 'package:elearning/features/auth/data/model/signup_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);

  Future<Either<Failure, SignupResponse>> signup(SignupRequest request);
}

class AuthRepositoryImpl extends AuthRepository{

  final SupabaseServices supabase;

  AuthRepositoryImpl(this.supabase);

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try{
      final response = await supabase.client.auth
          .signInWithPassword(email: request.email ?? '', password: request.password ?? '');
      return Right(LoginResponse());
    } on AuthException catch(e){
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, SignupResponse>> signup(SignupRequest request) async {
    try{
      final response = await supabase.client.auth
          .signUp(data: {'fullName': request.fullName ?? ''}, email: request.email ?? '', password: request.password ?? '');
      return Right(SignupResponse());
    } on AuthException catch(e){
      return Left(Failure(e.message));
    }
  }
}