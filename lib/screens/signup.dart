import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:worker/services/auth.dart';
//import 'package:worker/widgets/sign_button.dart';
import 'login.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
   var _dropdownitemlist = ['House Painting', 'Vehicle Reparing', 'Furniture Reparing', 'Television Reparing','Laptop Reparing'];
  var _values="House Painting";
  TextEditingController emailController, mobilenumberController,nameController,addressController;
  DatabaseReference _ref;
  @override
  void initState(){
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    mobilenumberController = TextEditingController();
    addressController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('WorkerRequest');
  }
  Widget build(BuildContext context) {
      ScreenScaler scale = ScreenScaler()..init(context);
   // AuthService data = Provider.of<AuthService>(context);
    // ignore: deprecated_member_use
  //  final _firestore = Firestore.instance;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height:100),
               Image.asset('assets/workerimage.png',
                   height: scale.getHeight(20)),
              SizedBox(height: scale.getHeight(3)),

            //Fullname Textfeild
            TextField(
              controller: nameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Enter full name',
                hintStyle: TextStyle(fontFamily: 'SourceCodePro',fontSize: 18),
                icon: Icon(Icons.people_outline,color: Colors.lightGreenAccent[400],),
              ),
            ),
            SizedBox(height: 15,),
            

            //email Textfeild
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                 decoration:
            InputDecoration(
              hintText: 'Enter email',
              hintStyle: TextStyle(fontFamily:'SourceCodePro',fontSize: 18),
             icon: Icon(Icons.email_outlined,color: Colors.deepOrange[400],),),
            ),
              const SizedBox(height: 15),



            //Address Textfeild
            TextField(
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              decoration: InputDecoration(
              hintText: 'Enter your Address', 
              hintStyle: TextStyle(fontFamily: 'SourceCodePro',fontSize:18),
              icon:Icon(Icons.location_pin,color:Colors.green[400])),
            ),
            SizedBox(height:15),

              //Mobile Number TextFeild
              TextField(
                controller: mobilenumberController,
                keyboardType: TextInputType.phone,
                 decoration:
            InputDecoration(hintText: 'Enter Mobile number',
            hintStyle: TextStyle(fontFamily: 'SourceCodePro',fontSize: 18),
             icon: Icon(Icons.phone_android,color: Colors.black,),),
            
              ),
            SizedBox(height: 20),
              Text("Your Specification in",style: 
              TextStyle(fontFamily:'SourceCodePro',fontSize: 18.0,fontWeight: FontWeight.bold),),


            //Dropdown button
                DropdownButton<String>(value: _values,
                items: _dropdownitemlist.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _values = value;

                    print("value chnged to $value");
                  });
                  value = _values;
                },
              ),


              const SizedBox(height: 25),
              // SignButton(
              //   text: 'Request as Service Provider',
              //   onPressed: () {
              //     data.createAccountWithEmailAndPassword().then((signedInUser) {
              //       _firestore.collection('Workers').add({
              //         'email': data.email,
              //       });
              //     }).whenComplete(() {
              //       if (data.userLoggedIn) {
              //         showDialog(
              //             context: context,
              //             builder: (_) => new AlertDialog(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(12.0)),
              //                   backgroundColor: Colors.white,
              //                   title: new Text(
              //                     "Sucessfully Registered",
              //                     textAlign: TextAlign.center,
              //                   ),
              //                   content: new Text(
              //                     "Press OK to signin to your account",
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                     ),
              //                   ),
              //                   actions: <Widget>[
              //                     TextButton(
              //                         onPressed: () {
              //                           Navigator.pushReplacement(
              //                               context,
              //                               MaterialPageRoute(
              //                                   builder: (_) => WorkerLogin()));
              //                         },
              //                         child: Text("OK"))
              //                   ],
              //                 ));
              //       } else {
              //         showDialog(
              //             context: context,
              //             builder: (_) => new AlertDialog(
              //                   shape: RoundedRectangleBorder(
              //                       borderRadius: BorderRadius.circular(12.0)),
              //                   backgroundColor: Colors.blueGrey[200],
              //                   title: new Text(
              //                     "Error 404",
              //                     textAlign: TextAlign.center,
              //                   ),
              //                   content: new Text(
              //                     "enter valid email format for registeration",
              //                     textAlign: TextAlign.center,
              //                     style: TextStyle(
              //                       fontSize: 16.0,
              //                     ),
              //                   ),
              //                   actions: <Widget>[],
              //                 ));
              //       }
              //     });
              //   },
              // )
              ElevatedButton(onPressed: (){
               if (emailController.text.isEmpty || mobilenumberController.text.isEmpty || nameController.text.isEmpty || addressController.text.isEmpty) {
                 showDialog(
                            barrierDismissible:false,
                            context: context,
                            builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(14.0)),
                                  backgroundColor: Colors.blueGrey[200],
                                  title: new Text(
                                    "Error",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Newsreader'),
                                  ),
                                  content: new Text(
                                    "Please fill up valid details",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16.0,fontFamily: 'Newsreader'),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          'OK',
                                          style: TextStyle(fontSize: 16.0),
                                        ))
                                  ],
                                ));
               } else {
                 requestasWorker(_values);
               }

              }, child: Text('Request',style: TextStyle(fontFamily: 'SourceCodePro',fontSize: 18),)),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ),
      
    );
  }

 void requestasWorker(String _values){
   String name = nameController.text;
   String email = emailController.text;
   String address = addressController.text;
   String mobilenumber = mobilenumberController.text;
   String servicename = _values;
   String requestStatus = "Pending";
   Map<String, String> requestbyworker = {
     'name': name,
     'email': email,
     'address': address,
     'mobilenumber': mobilenumber,
     'servicename': servicename,
     'serviceStatus': requestStatus

   };
   _ref.push().set(requestbyworker);

   showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0)),
              backgroundColor: Colors.blueGrey[200],
              title: new Text(
                "ThankYou",
                style:
                    TextStyle(fontFamily: 'Rubik', backgroundColor: Colors.red),
                textAlign: TextAlign.center,
              ),
              content: new Text(
                "You have Successfully made request as Service provider.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WorkerLogin()));
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(fontSize: 16.0),
                    ))
              ],
            ));
 }
}


