import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'home.dart';

class OTPNewScreen extends StatefulWidget {
  final String phone;
  OTPNewScreen(this.phone);
  @override
  _OTPNewScreenState createState() => _OTPNewScreenState();
}

class _OTPNewScreenState extends State<OTPNewScreen> {

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController _pinPutController = TextEditingController();
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
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin)  {
                    Navigator.pushAndRemoveUntil(
                        context,
                       MaterialPageRoute(builder: (context) => Home()),
                        (route) => false);
                  },
                ),
              )
            ],
          ),
        ),
      ),

    );
  }

}
