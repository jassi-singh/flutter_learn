import 'package:flutter/material.dart';

class CallLockScreen extends StatelessWidget {
  const CallLockScreen({ Key? key }) : super(key: key);
  static const routeName = '/call_lock_screen';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Call Lock Screen"),
      ),
    );
  }
}