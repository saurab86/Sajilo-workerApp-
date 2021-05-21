import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worker/screens/home.dart';


class SpinkitAnimationPage extends CupertinoPageRoute {
  SpinkitAnimationPage()
      : super(builder: (BuildContext context) => new Spinkit());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation,
     child: new Spinkit());
  }
}


class Spinkit extends StatefulWidget {
  @override
  _SpinkitState createState() => _SpinkitState();
}

class _SpinkitState extends State<Spinkit> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).push(WorkerHomePageAnimation());
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitWave(
              size: 80.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 18.0,
          ),
          Text(
            "LOADING...",
            style: TextStyle(fontFamily: "Rubik", fontSize: 16.0),
          )
        ],
      ),
    );
  }
}
