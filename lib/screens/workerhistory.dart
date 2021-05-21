import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class WorkerHistory extends StatefulWidget {
  @override
  _WorkerHistoryState createState() => _WorkerHistoryState();
}

class _WorkerHistoryState extends State<WorkerHistory> {
 Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('BookingInfo');
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("BookingInfo");
    FirebaseDatabase.instance.reference().child('BookingInfo');
  }

// ignore: missing_return
Widget _buildBookingItem({Map bookinginfo}) {
   if (bookinginfo['BookingStatus'] == 'Accepted') {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 160.0,
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
                      "You have accepted request of",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['name'] + ".",
                      style: TextStyle(fontSize: 17.0, fontFamily: 'Newsreader',color: Colors.black,
                      fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height:12),
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.book,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Service Booked:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        bookinginfo['service'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
               
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 16.0,
                      ),
                      Text('Booked Time:',
                          style: TextStyle(
                              fontFamily: 'RubNewsreaderik',
                              fontSize: 16.0,
                              color: Colors.brown[600])),
                      SizedBox(width: 5),
                      Text(bookinginfo['BookedTimeAndDate'],
                          style: TextStyle(fontFamily: 'Newsreader', fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),

              ],
            ),
          ),
        ),
      );
    }

}


 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text(
          "",
          style: TextStyle(fontWeight: FontWeight.w300,fontFamily: 'Newsreader'),
        ),
        leadingWidth: 50,
        leading: Icon(Icons.notifications_active),
        backgroundColor: Colors.teal[300],
      ),
      body: Container(
        color: Colors.white,
        child: FirebaseAnimatedList(
            duration: Duration(microseconds: 100),
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map bookinginfo = snapshot.value;
              bookinginfo['key'] = snapshot.key;
              return _buildBookingItem(bookinginfo: bookinginfo);
            }),
      ),
      
    );
  }
}