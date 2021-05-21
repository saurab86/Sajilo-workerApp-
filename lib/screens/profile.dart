import 'package:flutter/material.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[300],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.pinkAccent])),
            child: Container(
              width: double.infinity,
              height: 250.0,
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/workerimage.png'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Jon Snow",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                    ]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
