import 'package:elearning/core/network/supabase/supabase_keys.dart';
import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:elearning/core/shared/errors/failure.dart';
import 'package:elearning/core/storage/cache/cache_helper.dart';
import 'package:elearning/core/storage/cache/cache_keys.dart';
import 'package:elearning/features/auth/data/model/login_request.dart';
import 'package:elearning/features/auth/data/model/login_response.dart';
import 'package:dartz/dartz.dart';
import 'package:elearning/features/auth/data/model/signup_request.dart';
import 'package:elearning/features/auth/data/model/signup_response.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);

  Future<Either<Failure, SignupResponse>> signup(SignupRequest request);

  Future<void> saveUserName(String name);
}

class AuthRepositoryImpl extends AuthRepository{

  final SupabaseServices _supabase;
  final CacheHelper _cacheHelper;

  AuthRepositoryImpl({
    required this._supabase,
    required this._cacheHelper
  });

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    try{
      final response = await _supabase.client.auth
          .signInWithPassword(email: request.email ?? '', password: request.password ?? '');
      return Right(LoginResponse(
        id: response.user?.id,
        name: response.user?.userMetadata?[SupabaseKeys.name],
        token: response.session?.accessToken
      ),);
    } on AuthException catch(e){
      return Left(Failure(e.message));
    } catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SignupResponse>> signup(SignupRequest request) async {
    try{
      final response = await _supabase.client.auth
          .signUp(data: {SupabaseKeys.name: request.fullName ?? ''},
            email: request.email ?? '', password: request.password ?? '');
      return Right(SignupResponse(
          id: response.user?.id,
          name: response.user?.userMetadata?[SupabaseKeys.name],
          token: response.session?.accessToken
      ));
    } on AuthException catch(e){
      return Left(Failure(e.message));
    }
  }

  @override
  Future<void> saveUserName(String name) async{
    await _cacheHelper.write(CacheKeys.name, name);
  }

}