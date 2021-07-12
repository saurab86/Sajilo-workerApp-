import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class Settingsbar extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<Settingsbar> {
 

 
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'helpsajilo@gmail.com',
      queryParameters: {'subject': 'Help for :'});

 

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal[300],
        title: Text("For Help",style: TextStyle(fontFamily: 'Newsreader',fontSize: 18.0),),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
            Column(
              children: <Widget>[
                Text(
                  "For any help:",
                  style: TextStyle(fontFamily: 'Newsreader', fontSize: 19.0),
                ),

                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () => {
                    
                  },
                  // padding: EdgeInsets.all(10),
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/phone.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Call Now",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: 'Newsreader',
                            ),
                          )),
                    ],
                  ),
                ),
                // FlatButton(
                //   onPressed: () => setState(() {
                //     _launched = _launchInBrowser('http://nec.edu.np/');
                //   }),
                //   padding: EdgeInsets.all(10),
                //   child: new Row(
                //     mainAxisSize: MainAxisSize.min,
                //     children: <Widget>[
                //       new Image.asset(
                //         'assets/images/browsericon.jpg',
                //         height: 40.0,
                //         width: 40.0,
                //       ),
                //       Padding(
                //           padding: EdgeInsets.only(left: 10.0),
                //           child: new Text(
                //             "Visit Website",
                //             style: TextStyle(
                //                 fontSize: 15.0, fontWeight: FontWeight.bold),
                //           ))
                //     ],
                //   ),
                //),

                SizedBox(
                  height: 10.0,
                ),
                TextButton(
                  onPressed: () => setState(() {
                    launch(_emailLaunchUri.toString());
                  }),
                  //
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Image.asset(
                        'assets/emailicon.png',
                        height: 40.0,
                        width: 40.0,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: new Text(
                            "Email:helpsajilo@gmail.com",
                            style:
                                TextStyle(fontSize: 18.0, fontFamily: 'Newsreader'),
                          ))
                    ],
                  ),
                ),
  
              ],
            ),
            SizedBox(
              height: 10.0,
            ),

          ],
        ),
      ),
    );
  }
}
