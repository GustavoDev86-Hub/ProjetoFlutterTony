import 'package:supabase_flutter/supabase_flutter.dart';

const String supabaseUrl = 'https://ouuchfyvzobunjrtbsqo.supabase.co';
const String supabaseAnonKey = 'sb_publishable_uRkIEV78t7opzV8bfqxirg_uA3R2nHw';

Future<void> inicializarSupabase() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );
}

SupabaseClient get supabase => Supabase.instance.client;