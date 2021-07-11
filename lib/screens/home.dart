import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:provider/provider.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:worker/screens/gridview.dart';
import 'package:worker/screens/login.dart';
import 'package:worker/screens/userfeedback.dart';
import 'package:worker/screens/userhistory.dart';
import 'package:worker/screens/workerhistory.dart';
import 'package:worker/services/auth.dart';
import 'package:worker/widgets/logoutbtn.dart';


class WorkerHomePageAnimation extends CupertinoPageRoute {
  WorkerHomePageAnimation()
      : super(builder: (BuildContext context) => new WorkerHomePage());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation,
     child: new WorkerHomePage());
  }
}


class WorkerHomePage extends StatefulWidget {
  @override
  _WorkerHomepAgeState createState() => _WorkerHomepAgeState();
}

class _WorkerHomepAgeState extends State<WorkerHomePage> {
  FSBStatus status;
  Future<bool> _onBackPressed() {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.white,
              title: Text("Do you really want to exit?"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text(
                      "No",
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0),
                    )),
                TextButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text(
                      "Yes",
                      style: TextStyle(fontFamily: 'Rubik', fontSize: 17.0),
                    ))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          backgroundColor: Color(0xff392850),
          appBar: AppBar(
            backgroundColor: Colors.teal[300],
            title: Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.w500,fontFamily: 'Newsreader'),
            ),
            centerTitle: true,
          ),

          body: SwipeDetector(
            onSwipeRight: () {
              setState(() {
                status = FSBStatus.FSB_OPEN;
              });
            },
            onSwipeLeft: () {
              setState(() {
                status = FSBStatus.FSB_CLOSE;
              });
            },
            child: FoldableSidebarBuilder(
              status: status,
              drawer: CustomDrawer(
                closeDrawer: () {
                  setState(() {
                    status = FSBStatus.FSB_CLOSE;
                  });
                },
              ),
              screenContents: Gridlist(),
            ),
          ),
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.deepOrange,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  status = status == FSBStatus.FSB_OPEN
                      ? FSBStatus.FSB_CLOSE
                      : FSBStatus.FSB_OPEN;
                });
              }),
          // padding: EdgeInsets.only(top: 40.0),
          // child: Gridlist(),
        ));
  }
}

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthService data = Provider.of<AuthService>(context);
    ScreenScaler scale = ScreenScaler();
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: Column(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey.withAlpha(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/profile.png",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Sajilo",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold,fontFamily: 'Newsreader'),
                  )
                ],
              )),

          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
                Navigator.of(context).push(UserHistoryAnimation());
            },
            leading: Icon(Icons.person_add_alt_1_sharp),
            title: Text("User Requests",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WorkerHistory()));
            },
            leading: Icon(Icons.history),
            title: Text("Your History",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
            ListTile(
            onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (_)=>UserFeedbacks()));
            },
            leading: Icon(Icons.feedback),
            title: Text("User Feedbacks",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),),
          ),
          Divider(
            height: 2,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              LogoutButton(data: data, scale: scale);
              data.signOut().whenComplete(() {
                // Navigator.pushReplacement(
                //     context, MaterialPageRoute(builder: (_) => WorkerLogin()));
                Navigator.of(context).push(WorkerLoginAnimationPage());
              });
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Log Out",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18),),
          ),
        ],
      ),
    );
  }
}
