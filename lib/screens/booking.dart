import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:sajilo/services/auth.dart';

class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  Query _ref;
  void initState() {
    // AuthService data = Provider.of<AuthService>(context);
    // String _emailid = data.userInfo;
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child("BookingInfo");
    // _ref = FirebaseDatabase.instance
    //     .reference()
    //     .child("BookingInfo")
    //     .orderByChild("email")
    //     .equalTo('kiran@gmail.com');
  }

  Widget _buildBookingItem({Map bookinginfo}) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.pinkAccent,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(8.0),
        height: 100.0,
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
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Name:",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'Rubik',
                        color: Colors.brown[600]),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    bookinginfo['name'],
                    style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
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
                          fontFamily: 'Rubik',
                          color: Colors.brown[600]),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      bookinginfo['service'],
                      style: TextStyle(fontSize: 16.0, fontFamily: 'Rubik'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        color: Colors.white,
        child: FirebaseAnimatedList(
            query: _ref,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              Map bookinginfo = snapshot.value;
              return _buildBookingItem(bookinginfo: bookinginfo);
            }),
      ),
    );
  }
}
