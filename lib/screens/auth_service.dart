import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final _supabaseClient = Supabase.instance.client;

  // Sign up method
  Future<void> signUp(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Sign up failed');
      }
    } catch (error) {
      throw Exception('Error during sign up: $error');
    }
  }

  // Sign in method
  Future<void> signIn(String email, String password) async {
    try {
      final response = await _supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.session == null) {
        throw Exception('Sign in failed');
      }
    } catch (error) {
      throw Exception('Error during sign in: $error');
    }
  }

  // Sign out method
  Future<void> signOut() async {
    try {
      await _supabaseClient.auth.signOut();
    } catch (error) {
      throw Exception('Error during sign out: $error');
    }
  }

  // Check if the user is logged in
  bool isLoggedIn() {
    return _supabaseClient.auth.currentSession != null;
  }
}
