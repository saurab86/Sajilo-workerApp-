import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserHistoryAnimation extends CupertinoPageRoute {
  UserHistoryAnimation()
      : super(builder: (BuildContext context) => new UserBookingHistory());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation,
     child: new UserBookingHistory());
  }
}


// ignore: must_be_immutable
class UserBookingHistory extends StatefulWidget {
  String dbk;
  UserBookingHistory({this.dbk});
  @override
  _UserBookingHistoryState createState() => _UserBookingHistoryState();
}

class _UserBookingHistoryState extends State<UserBookingHistory> {
  Query _ref;
  DatabaseReference reference =
      FirebaseDatabase.instance.reference().child('BookingInfo');
  void initState() {
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("BookingInfo");
    FirebaseDatabase.instance.reference().child('BookingInfo');
  }

  Widget _buildBookingItem({Map bookinginfo}) {
    if (bookinginfo['BookingStatus'] == 'Pending') {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 360.0,
          child: SafeArea(
            child: Column(
              // Text('History'),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Name:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),


               ////
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      size: 20,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Mobile Number:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['mobilenumber'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(height:10),

                ////
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
                  height: 10.0,
                ),
             
             ////
                Row(
                  
                    children: [
                      Icon(
                        Icons.location_city,
                        size: 20,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      
                      Text(
                        "Address:",
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'Newsreader',
                            color: Colors.brown[600]),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    Expanded(
                               child: Text(
                          bookinginfo['address'],
                          style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                          
                        ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 10.0,
                ),

                ///
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "email:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['email'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),

                ///
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
                ///
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.hourglass_empty_rounded,
                      size: 20.0,
                    )
                  ],
                )),
                SizedBox(
                  height: 10.0,
                ),
              
              ///
                Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 12,),

               ///
                SafeArea(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          _acceptRequestDialogBox(bookinginfo: bookinginfo);
                        },
                        child: Text(
                          'Accept Request',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Newsreader',
                              color: Colors.white),
                        ))
                  ],
                ))
              ],
            ),
          ),
        ),
      );
    }
    
     else {
      return SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.teal[300],
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.all(8.0),
          height: 330.0,
          child: SafeArea(
            child: Column(
              // Text('History'),
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Name:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['name'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                

                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 20,
                      color: Colors.indigo,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Mobile Number:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      bookinginfo['mobilenumber'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
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
                  height: 10.0,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Address:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                                          child: Text(
                        bookinginfo['address'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              
                Row(
                  children: [
                    Icon(
                      Icons.email,
                      size: 20,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "email:",
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['email'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                SafeArea(
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.0,
                      ),
                      Text('Booked Time:',
                          style: TextStyle(
                              fontFamily: 'Newsreader',
                              fontSize: 16.0,
                              color: Colors.brown[600])),
                      SizedBox(width: 6),
                      Text(bookinginfo['BookedTimeAndDate'],
                          style: TextStyle(fontFamily: 'Rubik', fontSize: 16)),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                SafeArea(
                    child: Row(
                  children: [
                    Icon(
                      Icons.pending_sharp,
                      size: 20,
                      color: Colors.redAccent,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Service Request:',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Newsreader',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['BookingStatus'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.done_all_rounded, color: Colors.blueAccent)
                  ],
                )),

                 Row(
                  children: [
                    Text(
                      'Problem Description :',
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                              child: Text(
                        bookinginfo['ProblemDescription'],
                        style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  _acceptRequestDialogBox({Map bookinginfo}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.blueGrey[200],
              title: new Text(
                "Accept Booking Request",
                style: TextStyle(
                  fontFamily: 'Newsreader',
                ),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "Do you really want to Accept request?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0, fontFamily: 'Newsreader'),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      updateRequest(
                          bookinginfo['key'], bookinginfo['BookingStatus']);
                    },
                    child: Text(
                      'Yes',
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Rubik',
                          color: Colors.white),
                    )),
                SizedBox(
                  width: 35.0,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'No',
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontSize: 16.0,
                          color: Colors.white),
                    ))
              ],
            ));
  }

  updateRequest(String dbk, bookinginfo) async {
    await reference
        .child('$dbk')
        .update({'BookingStatus': 'Accepted'})
        .whenComplete(() => Navigator.pop(context))
        .then((value) => Fluttertoast.showToast(
            msg: "Service Accepted Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 4,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0));
    // .update(bookinginfo['BookingStatus'].toString('Accepted'))
    // .whenComplete(() => Navigator.pop(context));
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
        centerTitle: true,
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
