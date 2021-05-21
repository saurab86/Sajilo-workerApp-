import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:provider/provider.dart';
import 'package:worker/screens/signup.dart';
import 'package:worker/services/auth.dart';
import 'package:worker/widgets/custom_password_feild.dart';
import 'package:worker/widgets/custom_text_field.dart';
import 'package:worker/widgets/sign_button.dart';
import 'package:worker/widgets/spinkit.dart';



class WorkerLoginAnimationPage extends CupertinoPageRoute {
  WorkerLoginAnimationPage()
      : super(builder: (BuildContext context) => new WorkerLogin());
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation,
     child: new WorkerLogin());
  }
}

class WorkerLogin extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    ScreenScaler scale = ScreenScaler()..init(context);
    AuthService data = Provider.of<AuthService>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 55)),
              Image.asset('assets/workerimage.png',
                  height: scale.getHeight(18)),
              Text(
                "Sajilo",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'SourceCodePro'),
              ),
              Padding(padding: EdgeInsets.all(20.0)),

              // Text(
              //   "Enter your valid email and password for login",
              //   textAlign: TextAlign.center,
              //   style: TextStyle(
              //       fontSize: 18.0,
              //       fontFamily: 'Rubik',
              //       fontWeight: FontWeight.w300,
              //       color: Colors.black,
              //       fontStyle: FontStyle.normal),
              // ),
              SizedBox(height: scale.getHeight(2.0)),
              Padding(padding: EdgeInsets.only(top: 2.0)),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: 'Enter Your Email',
                onChanged: (value) => data.email = value,
              ),
              const SizedBox(height: 12.0),
              CustomTextField1(
                hintText: 'Enter Password',
                onChanged: (value) => data.password = value,
              ),
              const SizedBox(height: 25),
              SignButton(
                text: 'Log in',
                onPressed: () {
                  data.signInWithEmailAndPassword().whenComplete(() {
                    if (data.userLoggedIn) {
                          Navigator.of(context).push(SpinkitAnimationPage());
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => new AlertDialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0)),
                                backgroundColor: Colors.white,
                                title: new Text(
                                  "Error 404",
                                  textAlign: TextAlign.center,
                                ),
                                content: new Text(
                                  "Username and password didn't match or may be account not registered",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                                actions: <Widget>[],
                              ));
                    }
                  });
                },
              ),
              const SizedBox(height: 35),

             Divider(
            height: 20,
            color: Colors.grey,
          ),

              //////////////////////
              TextButton(
                  onPressed: () {
                      //Navigator.of(context).push(SignUpAnimation());
                      Navigator.push(context, PageRouteBuilder(
                                 transitionDuration: Duration(milliseconds: 500),
                                pageBuilder:
                                (context, animation, secondaryAnimation) =>SignUp(),
                                transitionsBuilder: (context, animation,secondaryAnimation, child) 
                                {
                                  var begin = Offset(0.0, 1.0);
                                  var end = Offset.zero;
                                  var curve = Curves.ease;
                                  var tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));
                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                }));
                  },
                  child: Text("Apply as Service provider",style: TextStyle(fontSize: 16,fontFamily:'SourceCodePro',color: Colors.deepOrange)))
            ],
          ),
        ),
      ),
    );
  }
}
