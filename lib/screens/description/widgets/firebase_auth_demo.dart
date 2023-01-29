import 'package:flutter/material.dart';
import 'package:flutter_learn/utils/auth_service.dart';

class FirebaseAuthDemo extends StatelessWidget {
  FirebaseAuthDemo({Key? key}) : super(key: key);
  final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _signIn,
            child: const Text("Sign In"),
          ),
          ElevatedButton(
            onPressed: _signOut,
            child: const Text("Sign Out"),
          ),
        ],
      ),
    );
  }

  void _signIn() {
    _auth.signInWithGoogle();
  }

  void _signOut() {
    _auth.signOut();
  }
}
