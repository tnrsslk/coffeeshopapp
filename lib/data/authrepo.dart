import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AuthRepository {
  AuthRepository(FirebaseApp app, {required FirebaseAnalytics analytics})
      : _auth = FirebaseAuth.instanceFor(app: app),
        _analytics = analytics;

  final FirebaseAuth _auth;
  final FirebaseAnalytics _analytics;
  String _name = "";

  bool get isSignedIn => _auth.currentUser != null;

  Future<(bool, String?)> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _name = _auth.currentUser?.displayName ?? "";

      // Получаем UID пользователя
      String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        await _analytics.setUserId(id: userId); // Устанавливаем идентификатор пользователя
        await _analytics.logEvent(name: 'user_sign_in');
      }

      return (true, null);
    } catch (e) {
      FirebaseAuthException error = e as FirebaseAuthException;
      return (false, error.message);
    }
  }

  String getName() {
    return _name;
  }

  Future<void> changeName(String name) async {
    await _auth.currentUser?.updateDisplayName(name);
    _name = name;
    await _analytics.logEvent(name: 'user_change_name', parameters: {'name': name});
  }

  Future<(bool, String?)> signUp(String email, String password, String name) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser?.updateDisplayName(name);

      // Получаем UID пользователя
      String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        await _analytics.setUserId(id: userId); // Устанавливаем идентификатор пользователя
        await _analytics.logEvent(name: 'user_sign_up');
      }

      return (true, null);
    } catch (e) {
      FirebaseAuthException error = e as FirebaseAuthException;
      return (false, error.message);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _analytics.logEvent(name: 'user_sign_out');
  }

  Future<bool> deleteAccount(String pass) async {
    try {
      AuthCredential credential = EmailAuthProvider.credential(
          email: _auth.currentUser?.email ?? "", password: pass);
      await _auth.currentUser?.reauthenticateWithCredential(credential);
      await FirebaseFirestore.instance.collection("users").doc(getUid()).delete();
      await _auth.currentUser?.delete();
      await _analytics.logEvent(name: 'user_delete_account');
      return true;
    } catch (e) {
      return false;
    }
  }

  String? getUid() {
    return _auth.currentUser?.uid;
  }
}
