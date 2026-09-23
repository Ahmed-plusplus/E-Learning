import 'package:elearning/core/network/supabase/supabase_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {

  final client = Supabase.instance.client;

  Future<void> init() async{
    await Supabase.initialize(url: SupabaseKeys.url, publishableKey: SupabaseKeys.publicKey);
  }
}