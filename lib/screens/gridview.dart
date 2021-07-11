import 'package:flutter/material.dart';
import 'package:worker/screens/userfeedback.dart';
import 'package:worker/screens/workerhistory.dart';
import 'package:worker/screens/settings.dart';
import 'package:worker/screens/userhistory.dart';

var services = [
  "Notification",
  "Your History",
  "User Feedbacks",
  "Settings",
];
var img = [
  "assets/notification.png",
  "assets/userhistory.png",
  "assets/feedback.png",
  "assets/setting.png",
];

var bookingsroutes = [
  "UserBookingHistory()",
  "Notification()",
  "UserBookingHistory()",
  "Settings()"
];

class Gridlist extends StatefulWidget {
  @override
  _Gridlist createState() => _Gridlist();
}

class _Gridlist extends State<Gridlist> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 4,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: InkWell(
              splashColor: Colors.green.withAlpha(30),
              onTap: () {
                if (index == 0) {
                          Navigator.of(context).push(UserHistoryAnimation());
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WorkerHistory()));
                } else if (index == 2) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UserFeedbacks()));
                } else {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Settingsbar()));
                }
              },
              child: Column(
                children: [
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    child: Image.asset(
                      img[index],
                      height: 90,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Container(
                    child: Text(
                      services[index],
                      style: TextStyle(
                        fontFamily: 'Newsreader',
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //SizedBox(height: 12.0),
                ],
              ),
            ),
          );
        });
  }
}
