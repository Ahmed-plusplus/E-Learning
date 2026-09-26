import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:elearning/core/storage/cache/cache_helper.dart';
import 'package:elearning/features/auth/data/repository/auth_repository.dart';
import 'package:elearning/features/base/data/repository/base_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<SupabaseServices>(SupabaseServices());
  final supabase = getIt<SupabaseServices>();
  getIt.registerSingleton<CacheHelper>(CacheHelper(FlutterSecureStorage()));
  final cacheHelper = getIt<CacheHelper>();

  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl(cacheHelper: cacheHelper, supabase: supabase));
  getIt.registerSingleton<BaseRepository>(BaseRepositoryImpl(cacheHelper: cacheHelper, supabase: supabase));

}