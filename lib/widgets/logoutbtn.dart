import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:worker/screens/login.dart';
import 'package:worker/services/auth.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({this.data, this.scale});
  final AuthService data;
  final ScreenScaler scale;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12,
      shape: const StadiumBorder(),
      child: TextButton(
        child: Text('Logout', style: TextStyle(fontSize: scale.getTextSize(7))),
        onPressed: () {
          data.signOut().whenComplete(() {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => WorkerLogin()));
          });
        },
      ),
    );
  }
}
