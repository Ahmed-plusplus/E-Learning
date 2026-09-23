import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator(){
  getIt.registerSingleton<SupabaseServices>(SupabaseServices());


}