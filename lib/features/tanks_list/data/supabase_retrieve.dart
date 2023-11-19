import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRetrieve {
  final _supabase = Supabase.instance.client;

  getListOfTanks() async {
    final data = _supabase.from("tankDatabase").select();
    return data;
  }
}
