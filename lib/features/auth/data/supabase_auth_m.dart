import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseAuthM {
  final _supabase = Supabase.instance.client;

  Future<AuthResponse> register({required email, required password}) async {
    return await _supabase.auth.signUp(email: email, password: password);
  }

  Future<AuthResponse> singIn({required email, required password}) async {
    return await _supabase.auth
        .signInWithPassword(email: email, password: password);
  }
}
