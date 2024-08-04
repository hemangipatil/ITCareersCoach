import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itcareerscoach/ProfileForm.dart';
import 'package:itcareerscoach/home.dart';
import 'package:itcareerscoach/model/profile.dart';
import 'package:pinput/pin_put/pin_put.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 1000,

          width: double.infinity,
          // padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.grey,
                    Colors.white,
                    Colors.grey
                  ]
              )
          ),
          child: Column(
            children: [

              SizedBox(height:20),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/pimg.png"),
                radius: 100,
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    ' Welcome To IT Careers Coach',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Center(
                  child: Text(
                    'Verify +91-${widget.phone}',
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 26),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: PinPut(
                  fieldsCount: 6,
                  textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async {
                    try {
                      await FirebaseAuth.instance
                          .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                          .then((value) async {
                        if (value.user != null) {
                          // Added to check if profile Exist or not
                          CheckProfileExist();
                          // Navigator.pushAndRemoveUntil(
                          //     context,
                          //  //   MaterialPageRoute(builder: (context) => Home()),
                          //      MaterialPageRoute(builder: (context) => FormScreen()),
                          //     (route) => false);
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      _scaffoldkey.currentState
                          .showSnackBar(SnackBar(content: Text('invalid OTP')));

                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              CheckProfileExist();
              //               Navigator.pushAndRemoveUntil(
//                   context,
// //                  MaterialPageRoute(builder: (context) => Home()),
//                    MaterialPageRoute(builder: (context) => FormScreen()),
//                   (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
// Added to check the profile already Exist or not
  Future CheckProfileExist() async {

    var user = await FirebaseAuth.instance.currentUser;
    var name, email, photoUrl,uuid, emailVerified;
    Profile profile;

    if (user != null) {
      name = user.displayName;
      email = user.email;
      photoUrl = user.photoURL;
      emailVerified = user.emailVerified;
      uuid = user.uid;

      // The user's ID, unique to the Firebase project. Do NOT use
      // this value to authenticate with your backend server, if
      // you have one. Use User.getToken() instead.


    }

    CollectionReference users =  await FirebaseFirestore.instance.collection(
        'Profile');
    FirebaseFirestore.instance
        .collection('Profile')
        .doc(uuid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print('Document exists on the database');
        // GO to Home page and not Profile page
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home()),
                (route) => false);


      }
      else{
        Navigator.pushAndRemoveUntil(
            context,
//                  MaterialPageRoute(builder: (context) => Home()),
            MaterialPageRoute(builder: (context) => FormScreen()),
                (route) => false);

// Go to Profile page and not home page
        print('Add Profile for new user - AddProfileAndImage called');
        print(user.uid);
        profile.name = "";
        print('name value while setting user$profile.name');
        profile.lastname = "";
        profile.EmailAddress = "";
        profile.image = "";
        profile.PhoneNo = "";
        profile.Address = "";

        print(uuid);
        users.doc(uuid).set({
          'name': "",
          'lastname':"",
          'id':"",
          'image':"",
          'PhoneNo':"",
          'Address':"",
          'EmailAddress':"",
          'createdAt':"",
          'updatedAt':"",

        }

        )
            .then((value) => print("User Added"))
            .catchError((error) => print("Failed to add user: $error"));
      }
    });




  }




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
