import 'package:dartz/dartz.dart';
import 'package:elearning/core/network/supabase/supabase_keys.dart';
import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:elearning/core/shared/errors/failure.dart';

abstract class CourseRepository {
  Future<Either<Failure, bool>> checkEnrollment(int courseId);
  Future<Either<Failure, bool?>> enrollCourse(int courseId);
}

class CourseRepositoryImpl extends CourseRepository{

  SupabaseServices supabase;

  CourseRepositoryImpl({required this.supabase});

  @override
  Future<Either<Failure, bool>> checkEnrollment(int courseId) async{
    try {
      final token = supabase.client.auth.currentSession?.accessToken ?? '';
      final response = await supabase.client.from(
          SupabaseKeys.courseSubscriptionTable)
          .setHeader(SupabaseKeys.authHeader, SupabaseKeys.bearerAuth(token))
          .select()
          .eq(SupabaseKeys.userIdColumn, supabase.client.auth.currentUser!.id)
          .eq(SupabaseKeys.courseIdColumn, courseId);
      print(response);
      return Right(response.isNotEmpty);
    } catch(e){
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool?>> enrollCourse(int courseId) async {
    try {
      final token = supabase.client.auth.currentSession?.accessToken ?? '';
      final response = await supabase.client.from(
          SupabaseKeys.courseSubscriptionTable)
          .setHeader(SupabaseKeys.authHeader, SupabaseKeys.bearerAuth(token))
          .insert({
            SupabaseKeys.userIdColumn: supabase.client.auth.currentUser!.id,
            SupabaseKeys.courseIdColumn: courseId
          });
      print(response);
      return Right(response);
    } catch(e){
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }
}