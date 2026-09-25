import 'package:elearning/core/network/supabase/supabase_services.dart';
import 'package:elearning/core/service/service_locator.dart';
import 'package:elearning/core/utils/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/route/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await dotenv.load(fileName: '.env');
  await getIt.get<SupabaseServices>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CS Academy E-learning App',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.appTheme,
      routerConfig: appRouter,
    );
  }
}
