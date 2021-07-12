import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class UserFeedbacks extends StatefulWidget {

  @override
  _UserFeedbacksState createState() => _UserFeedbacksState();
}

class _UserFeedbacksState extends State<UserFeedbacks> {
  Query _ref;
  DatabaseReference reference = FirebaseDatabase.instance.reference().child('UserFeedback');
  void initState(){
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("UserFeedback");
  }


// ignore: missing_return
Widget _buildUserFeedbacks({Map userfeedback}) {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 150.0,
          child: SafeArea(
            child: Column(
              // Text('History'),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.album,size: 12,),
                    SizedBox(width: 5,),
                    Text(
                      "Feedback from",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      userfeedback['email'] +".",
                      style: TextStyle(fontSize: 17.0, fontFamily: 'Newsreader',color: Colors.black,
                      fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                 
                 SizedBox(height: 4,),
                    Text(userfeedback['Userfeedback'],
                    style:TextStyle(color: Colors.white,fontFamily: 'Newsreader',fontSize: 16) ,)
                  

              ],
            ),
          ),
        ),
      );
    

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
         title: Text(
          "User Feedback",
          style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Newsreader',fontSize: 18),
        ),
        leadingWidth: 50,
        automaticallyImplyLeading: true,
        backgroundColor: Colors.teal[300],
      ),
      body: Container(
        color: Colors.white,
        child: FirebaseAnimatedList(
            duration: Duration(microseconds: 100),
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map userfeedback = snapshot.value;
              userfeedback['key'] = snapshot.key;
              return _buildUserFeedbacks(userfeedback: userfeedback);
            }),
      ),
      
    );
  }
}