import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuth {
  final _supabase = Supabase.instance.client;

  void register({required email, required password}) {
    _supabase.auth.signUp(email: email, password: password);
  }

  Future<AuthResponse> singIn({required email, required password}) {
    return _supabase.auth.signInWithPassword(email: email, password: password);
  }
}
