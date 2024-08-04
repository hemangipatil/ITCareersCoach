import 'package:cloud_firestore/cloud_firestore.dart';



class Profile {
  String id;
  String name;
  String lastname;
  String image;
  String PhoneNo;
  String Address;
  String EmailAddress;
  Timestamp createdAt;
  Timestamp updatedAt;

  Profile();

  Profile.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    name = data['name'];
    lastname = data['lastname'];
    PhoneNo = data['PhoneNo'];
    Address = data['Address'];
    EmailAddress = data['EmailAddress'];
    image = data['image'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'PhoneNo' : PhoneNo,
      'Address' :Address,
      'EmailAddress':EmailAddress,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
