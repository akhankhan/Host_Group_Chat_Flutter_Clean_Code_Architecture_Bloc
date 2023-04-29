import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:host_group_chat/features/domin/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? phoneNumber,
    final bool? isOnline,
    final String? uid,
    final String? status,
    final String? profileUrl,
    final String? password,
    final String? dob,
    final String? gender,
  }) : super(
          uid: uid,
          dob: dob,
          email: email,
          gender: gender,
          isOnline: isOnline,
          name: name,
          password: password,
          phoneNumber: phoneNumber,
          profileUrl: profileUrl,
          status: status,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      status: snapshot.get('status'),
      profileUrl: snapshot.get('profileUrl'),
      phoneNumber: snapshot.get('name'),
      isOnline: snapshot.get('isOnline'),
      gender: snapshot.get('gender'),
      email: snapshot.get('email'),
      dob: snapshot.get('dob'),
      uid: snapshot.get('uid'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'uid': uid,
      'dob': dob,
      'email': email,
      'gender': gender,
      'isOnline': isOnline,
      'name': name,
      'phoneNumber': phoneNumber,
      'profileUrl': profileUrl,
      'status': status,
    };
  }
}
