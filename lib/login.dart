import 'package:flutter/material.dart';
import 'package:itcareerscoach/otp.dart';
import 'package:itcareerscoach/otp_new.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number',
        icon: Icon(Icons.phone_android),
        hintText: 'Phone Number',
        prefix: Padding(
          padding: EdgeInsets.all(4),
          child: Text('+91'),
        ),
      ),
      keyboardType: TextInputType.phone,
      maxLength: 10,
      controller: _controller,
      validator: (String value) {
        if (value.isEmpty ||value.length < 10) {
          return ' Valid Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        // _phoneNumber = value;
        _controller.text = value;

      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Authentication'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 1000,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height:10),
            CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/pimg.png"),
              radius: 70,
            ),
            Container( //Added Container to have form validation in the phone no text filed
              margin: EdgeInsets.all(10),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 16),
                      Text(
                        "Enter Your Phone No ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(height: 16),
                      _buildPhoneNumber(),

                      SizedBox(height: 20),
                      RaisedButton(
                        child: Text(
                          'Next',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          // _formKey.currentState.save();

                          FocusScope.of(context).requestFocus(new FocusNode());
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OTPNewScreen(_controller.text)));

                          //                    uploadProfileAndImage(_currentProfile, _imageFile);

                          //Send to API
                        },
                      )

                    ],
                  )
              ),
            ),



            // OLD code for the Phone no and Next Button



            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Center(
            //     child: Text(
            //       ' Enter your mobile no ',
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            //     ),
            //   ),
            // ),

            // Column(children: [
            // Container(
            //   margin: EdgeInsets.only(top: 10),
            //   child: Center(
            //     child: Text(
            //       'Phone Authentication',
            //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.only(top: 10, right: 10, left: 10,bottom: 0),
            //   child: TextFormField(
            //     decoration: InputDecoration(
            //       icon: Icon(Icons.phone_android),
            //       hintText: 'Phone Number',
            //       prefix: Padding(
            //         padding: EdgeInsets.all(4),
            //         child: Text('+91'),
            //       ),
            //     ),
            //     maxLength: 10,
            //     keyboardType: TextInputType.number,
            //     controller: _controller,
            //   ),
            // )
            // ]
            // ),
//             Container(
// //              margin: EdgeInsets.all(40),
//               margin: EdgeInsets.only(top: 0, right: 10, left: 10,bottom: 100),
//               width: double.infinity,
//               child: FlatButton(
//                 color: Colors.black,
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => OTPScreen(_controller.text)));
//                 },
//                 child: Text(
//                   'Next',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             )
          ],
        ),
      ),
    );
  }
}
