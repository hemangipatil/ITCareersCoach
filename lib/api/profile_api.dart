// import 'dart:io';
//
// import 'package:phone_auth_project/model/profile.dart';
// import 'package:phone_auth_project/notifier/auth_notifier.dart';
// import 'file:///D:/flutter_phone_authentication-main/lib/notifier/profile_notifier.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:path/path.dart' as path;
// import 'package:uuid/uuid.dart';
// import 'file:///D:/flutter_phone_authentication-main/lib/model/profile.dart';
//
//
// initializeCurrentUser(AuthNotifier authNotifier) async {
//   FirebaseUser firebaseUser = await FirebaseAuth.instance.currentUser();
//
//   if (firebaseUser != null) {
//     print(firebaseUser);
//     authNotifier.setUser(firebaseUser);
//   }
// }
//
// getProfile(ProfileNotifier profileNotifier) async {
//   QuerySnapshot snapshot = await Firestore.instance
//       .collection('Profile')
//       .orderBy("createdAt", descending: true)
//       .getDocuments();
//
//
//   snapshot.documents.forEach((document) {
//     Food food = Food.fromMap(document.data);
//
//   });
//
// //  foodNotifier.foodList = _foodList;
// }
//
// uploadProfileAndImage(Profile profile, bool isUpdating, File localFile, Function profileUploaded) async {
//   if (localFile != null) {
//     print("uploading image");
//
//     var fileExtension = path.extension(localFile.path);
//     print(fileExtension);
//
//     var uuid = Uuid().v4();
//
//     final StorageReference firebaseStorageRef =
//     FirebaseStorage.instance.ref().child('profile/images/$uuid$fileExtension');
//
//     await firebaseStorageRef.putFile(localFile).onComplete.catchError((onError) {
//       print(onError);
//       return false;
//     });
//
//     String url = await firebaseStorageRef.getDownloadURL();
//     print("download url: $url");
//     _uploadProfile(profile, isUpdating, profileUploaded, imageUrl: url);
//   } else {
//     print('...skipping image upload');
//     _uploadProfile(profile, isUpdating, profileUploaded);
//   }
// }
//
// _uploadProfile(Profile profile, bool isUpdating, Function profileUploaded, {String imageUrl}) async {
//   CollectionReference foodRef = Firestore.instance.collection('Profile');
//
//   if (imageUrl != null) {
//     profile.image = imageUrl;
//   }
//
//   if (isUpdating) {
//     profile.updatedAt = Timestamp.now();
//
//     await foodRef.document(profile.id).updateData(profile.toMap());
//
//     profileUploaded(profile);
//     print('updated food with id: ${profile.id}');
//   } else {
//     profile.createdAt = Timestamp.now();
//
//     DocumentReference documentRef = await foodRef.add(profile.toMap());
//
//     profile.id = documentRef.documentID;
//
//     print('uploaded food successfully: ${profile.toString()}');
//
//     await documentRef.setData(profile.toMap(), merge: true);
//
//     profileUploaded(profile);
//   }
// }

import 'dart:io';


import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:itcareerscoach/model/profile.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';
import'package:firebase_auth/firebase_auth.dart';


Future AddProfileAndImage(Profile profile) async {

  var user = await FirebaseAuth.instance.currentUser;
  var name, email, photoUrl,uuid, emailVerified;

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
    }
    else{

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
// new function to check if the user is new or exsting on the basis of that we
//will navigate to either Profile page or Home page





















//
// AddProfileAndImageNew(Profile profile) async {
//   var user = FirebaseAuth.instance.currentUser;
//   var  uuid = user.uid;
//
//
//   print('Add Profile for new user - AddProfileAndImage called');
//   print(user.uid);
//   profile.name = "";
//   profile.lastname = "";
//   profile.EmailAddress = "";
//   profile.image = "";
//   profile.PhoneNo = "";
//   profile.Address = "";
//
//
//   print(profile.name);
//   //CollectionReference users = FirebaseFirestore.instance.collection('Profile');
//   // DocumentReference userDocument = FirebaseFirestore.instance.collection('Profile').doc(uuid);
//   // await userDocument.update({'name' :profile.name})
//   //     .then((value) => print("User Updated"))
//   //     .catchError((error) => print("Failed to update user: $error"));
//
//   CollectionReference foodRef = FirebaseFirestore.instance.collection('Profile');
//
// //  await foodRef.doc(profile.id).update(profile.toMap());
//   await foodRef.doc(uuid).set(profile.toMap());
//   print('Added food with id: ${profile.id}');
//
// }


Future uploadProfileAndImage(Profile profile, File localFile, Function ProfileUploaded) async {
  var user = FirebaseAuth.instance.currentUser;
  var  uuid = user.uid;

  print('uploadprofilefunction called');
  print(user.uid);
  print(profile.name);
  //CollectionReference users = FirebaseFirestore.instance.collection('Profile');
  // DocumentReference userDocument = FirebaseFirestore.instance.collection('Profile').doc(uuid);
  // await userDocument.update({'name' :profile.name})
  //     .then((value) => print("User Updated"))
  //     .catchError((error) => print("Failed to update user: $error"));

  CollectionReference foodRef = FirebaseFirestore.instance.collection('Profile');

//  await foodRef.doc(profile.id).update(profile.toMap());
  await foodRef.doc(uuid).update(profile.toMap());
  ProfileUploaded(profile);
  print('updated food with id: ${profile.id}');

  }

