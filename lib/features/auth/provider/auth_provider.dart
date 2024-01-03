import "package:flutter/material.dart";
import '../models/fish_man_user.dart';

class AuthProvider extends ChangeNotifier {
  FishManUser? _currentUser;

  setCurrentUser({required user}) {
    _currentUser = user;
  }

  FishManUser? get currentUser => _currentUser;
}
