import 'package:elearning/core/network/supabase/supabase_keys.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseServices {

  late final SupabaseClient client;

  Future<void> init() async{
    await Supabase.initialize(url: SupabaseKeys.url, publishableKey: SupabaseKeys.publicKey);
    client = Supabase.instance.client;
  }
}