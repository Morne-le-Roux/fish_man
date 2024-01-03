import "package:flutter/cupertino.dart";
import "../data/supabase_auth_m.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class FishManUser extends ChangeNotifier {
  User? _currentUser;

  FishManUser() {
    _currentUser = SupabaseAuthM().getCurrentUser();
  }

  User? get currentUser => _currentUser;
}
