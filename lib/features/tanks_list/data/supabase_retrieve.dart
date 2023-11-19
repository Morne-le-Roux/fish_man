import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRetrieve {
  final supabase = Supabase.instance.client;

  getListOfTanks() async {
    final data = await supabase.from("tankDatabase").select();
    return data;
  }
}
