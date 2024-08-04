import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:itcareerscoach/api/profile_api.dart';
import 'package:itcareerscoach/home.dart';
import 'package:itcareerscoach/model/profile.dart';
import 'package:itcareerscoach/notifier/profile_notifier.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatefulWidget {

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  File _image;
  final picker = ImagePicker();
  String _name;
  String _email;
  String _password;
  String _url;
  String _phoneNumber;
  String _age;
  String _myActivity;
  var user = FirebaseAuth.instance.currentUser;
  var  uid ;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Profile _currentProfile;
  String _imageUrl;
  File _imageFile;
  bool isloading = true ;

  @override
  void initState() {
    super.initState();

    // commented becaouse the main dont have provider
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);

    if (profileNotifier.currentProfile != null) {
      _currentProfile = profileNotifier.currentProfile;
    } else {
      _currentProfile = Profile();
    }

    //Have commented to not show the image
    //  _imageUrl = _currentProfile.image;
    //uid = user.uid;
    // Added to test if user get added in the form screen
    //    AddProfileAndImage();
    AddProfileAndImage(_currentProfile);
    isloading = false;// to load the form and stop showing the loading screen

  }




  Widget _buildName(userDocument) {
    return TextFormField(

//       initialValue: _currentProfile.name,

      initialValue: userDocument["name"],
      // initialValue: 'Test text',
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentProfile.name = value;
        print(_currentProfile.name );
      },
    );
  }





  Widget _buildEmail(userDocument) {
    return TextFormField(
      initialValue: userDocument["EmailAddress"],
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _currentProfile.EmailAddress = value;
        //_email = value;
      },
    );
  }

  Widget _buildLastName(userDocument) {
    return TextFormField(
      initialValue: userDocument["lastname"],
      decoration: InputDecoration(labelText: 'Last Name'),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Last Name Required';
        }

        return null;
      },
      onSaved: (String value) {
        _currentProfile.lastname = value;

      },
    );
  }

  Widget _builURL() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Url'),
      keyboardType: TextInputType.url,
      validator: (String value) {
        if (value.isEmpty) {
          return 'URL is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _url = value;
      },
    );
  }

  Widget _buildPhoneNumber(userDocument) {
    return TextFormField(
      initialValue: userDocument["PhoneNo"],
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (String value) {
        // _phoneNumber = value;
        _currentProfile.PhoneNo = value;
      },
    );
  }

  Widget _buildAge() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      keyboardType: TextInputType.number,
      validator: (String value) {
        int calories = int.tryParse(value);

        if (calories == null || calories <= 0) {
          return 'Age must be greater than 0';
        }

        return null;
      },
      onSaved: (String value) {
        _age = value;
      },
    );
  }

  Widget _buildDegree() {
    return DropDownFormField(
      titleText: 'Select Degree',
      hintText: 'Please choose one',
      value: _myActivity,
      onSaved: (value) {
        setState(() {
          _myActivity = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _myActivity = value;
        });
      },
      dataSource: [
        {
          "display": "BE IT/ ENTC",
          "value": "BE IT/ ENTC",
        },
        {
          "display": "BSC",
          "value": "BSC",
        },
        {
          "display": "BCA",
          "value": "BCA",
        },
        {
          "display": "MCA",
          "value": "MCA",
        },
        {
          "display": "Soccer Practice",
          "value": "Soccer Practice",
        },
        {
          "display": "Baseball Practice",
          "value": "Baseball Practice",
        },
        {
          "display": "Football Practice",
          "value": "Football Practice",
        },
      ],
      textField: 'display',
      valueField: 'value',
    );
  }

  //Showing image added funtion form other app code

  //
  // Future _getImage() async {
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery,imageQuality: 50, maxWidth: 300,maxHeight: 300);
  //
  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }








  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: (){
        movetoHomeScreen();
        // move to home screen when you press the back button
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(' Your Profile info'),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                        (route) => false);
              },
            )
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
            //stream: FirebaseFirestore.instance.collection('Profile').doc(uid).snapshots(),
            stream: FirebaseFirestore.instance.collection('Profile').doc('0').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

              //==========show progress============
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              var userDocument = snapshot.data;
              // User userDocument here .........

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  //for Page design
                  height: 600,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.black,
                            Colors.black
                          ]
                      )
                  ),

                  child: Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60),)
                      ),
                      margin: EdgeInsets.all(0),
                      padding: EdgeInsets.all(10),
                      child: Form(
                        key: _formKey,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(height: 16),
                              Text(
                                "Profile",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 30),
                              ),
                              SizedBox(height: 16),

                              // Stack(
                              //   children: <Widget>[
                              //
                              //     Center(
                              //       child: _image == null
                              //           ? Text('No image selected.')
                              //           : Image.file(_image),
                              //     ),
                              //     IconButton(
                              //      icon: const Icon(Icons.arrow_forward_outlined),
                              //       tooltip: 'Select image',
                              //          onPressed:  _getImage,
                              //     ),
                              //   ],
                              // ),
                              //                    ElevatedButton(onPressed:()=> uploadImagetoFirebase(_image), child: Text('Upload to Firebase')),
                              //                   ElevatedButton(onPressed: ()=>updateUserdata(_name), child: Text(' add Document')),
                              //                      ElevatedButton(onPressed: ()=>updateEUserdata(_name), child: Text(' Update  Document')),

                              _buildName(userDocument),
                              _buildLastName(userDocument),
                              _buildEmail(userDocument),
                              //(),
                              // _builURL(),
                              _buildPhoneNumber(userDocument),
                              //_buildAge(),
                              //_buildDegree(),
                              SizedBox(height: 100),
                              RaisedButton(
                                child: Text(
                                  'SAVE',
                                  style: TextStyle(color: Colors.blue, fontSize: 16),
                                ),
                                onPressed: () {
                                  if (!_formKey.currentState.validate()) {
                                    return;
                                  }

                                  // _formKey.currentState.save();

                                  FocusScope.of(context).requestFocus(new FocusNode());
                                  _saveProfile();
                                  //                    uploadProfileAndImage(_currentProfile, _imageFile);



                                  print(_name);
                                  print(_email);
                                  print(_phoneNumber);
                                  print(_url);
                                  print(_password);
                                  print(_age);

                                  //Send to API
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
  void movetoHomeScreen(){
    print('move to home screen called');
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Home()),
            (route) => false);
  }
  // Future uploadImagetoFirebase(File localFile) async{
  //   FirebaseStorage storage = FirebaseStorage.instance;
  //   Reference ref = storage.ref().child('profile/images/'+"image" + DateTime.now().toString());
  //   UploadTask uploadTask = ref.putFile(localFile);
  //   uploadTask.then((res) {
  //     res.ref.getDownloadURL();
  //   });
  // }


  //
  // Future updateUserdata(String _name ) async {
  //   CollectionReference users = FirebaseFirestore.instance.collection(
  //       'Profile');
  //   // var firestore = FirebaseFirestore.instance;
  //   //   QuerySnapshot querySnapshot = await firestore.collection("profile").get();
  //   //   final documents = querySnapshot.docs;
  //   //   return documents
  //
  //   users.add({
  //     'name': "Prajakt Patil", // John Doe
  //
  //   })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }
  //
  // Future updateEUserdata(String _name ) async {
  //
  //   CollectionReference users = FirebaseFirestore.instance.collection('Profile');
  //   // var firestore = FirebaseFirestore.instance;
  //   //   QuerySnapshot querySnapshot = await firestore.collection("profile").get();
  //   //   final documents = querySnapshot.docs;
  //   //   return documents
  //
  //   users.doc('cu3EcImcpraymKC8gMxW').update({
  //     'name': "Prashant Patil", // John Doe
  //
  //   })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  _onProfileUpload(Profile profile) {
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context , listen: false);
    //  foodNotifier.addFood(food);
    profileNotifier.addProfile(profile);
    Navigator.pop(context);
  }
  _saveProfile() {
    print('saveFood Called');
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print('form saved');
    //#################### imptartnt function##########
    uploadProfileAndImage(_currentProfile, _imageFile,_onProfileUploaded);
    print("name: ${_currentProfile.name}");
    print("category: ${_currentProfile.id}");
    movetoHomeScreen();
    // print("_imageFile ${_imageFile.toString()}");
    // print("_imageUrl $_imageUrl");
  }
  _onProfileUploaded(Profile profile) {
    ProfileNotifier profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    profileNotifier.currentProfile;
    // Navigator.pop(context);
  }
}
