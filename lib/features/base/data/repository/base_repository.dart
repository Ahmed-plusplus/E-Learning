import 'package:dartz/dartz.dart';
import 'package:elearning/core/network/supabase/supabase_endpoints.dart';
import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:elearning/core/shared/errors/failure.dart';
import 'package:elearning/core/shared/models/Response.dart';
import 'package:elearning/core/storage/cache/cache_helper.dart';
import 'package:elearning/core/storage/cache/cache_keys.dart';
import 'package:elearning/features/base/data/model/course_model.dart';

abstract class BaseRepository {
  Future<String> getUserName();
  
  Future<Either<Failure, List<CourseModel>>> fetchAllCourses();
  
  Future<Either<Failure, List<CourseModel>>> fetchMyCourses();
}

class BaseRepositoryImpl extends BaseRepository{

  final CacheHelper _cacheHelper;
  final SupabaseServices _supabase;
  
  BaseRepositoryImpl({
    required this._cacheHelper,
    required this._supabase
  });

  @override
  Future<String> getUserName() async{
    return await _cacheHelper.read<String>(CacheKeys.name) ?? '';
  }

  @override
  Future<Either<Failure, List<CourseModel>>> fetchAllCourses() async {
    try {
      final jsonResponse = await _supabase.client.functions.invoke(
          SupabaseEndpoints.allCourses
      );
      final response = Response<List<CourseModel>>.fromJsonList(
          json: jsonResponse.data,
          parser: (data) => data.map((e) => CourseModel.fromJson(e)).toList()
      );
      if(response.success ?? false){
        return Right(response.data ?? []);
      }
      return Left(Failure(response.message ?? 'Unknown error'));
    } catch(e){
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> fetchMyCourses() async {
    try {
      final token = _supabase.client.auth.currentSession?.accessToken;
      final jsonResponse = (await _supabase.client.functions.invoke(
        SupabaseEndpoints.myCourses,
        headers: {
          'Authorization': 'Bearer $token',
        },
      ));
      final response = Response<List<CourseModel>>.fromJsonList(
          json: jsonResponse.data,
          parser: (data) => data.map((e) => CourseModel.fromJson(e)).toList()
      );
      if(response.success ?? false){
        return Right(response.data ?? []);
      }
      return Left(Failure(response.message ?? 'Unknown error'));
    } catch(e){
      return Left(Failure(e.toString()));
    }
  }
}