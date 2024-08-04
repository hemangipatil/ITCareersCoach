


import 'package:flutter/cupertino.dart';
import 'dart:collection';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itcareerscoach/model/profile.dart';




class ProfileNotifier with ChangeNotifier {


  Profile _currentProfile;

  Profile get currentProfile => _currentProfile;



  set currentProfile(Profile profile) {
    _currentProfile = profile;
    notifyListeners();
  }

  addProfile(Profile profile) {
    CollectionReference users = FirebaseFirestore.instance.collection(
        'Profile');
    users.add({
 //     'name': "Prajakt Patil",
      profile.id:users.id,
      profile.name: "prajakt Shivji patil",
      profile.image :' ',// John Doe
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
    notifyListeners();
  }

 }






