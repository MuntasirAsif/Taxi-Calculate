import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String profileImageUrl;
  //final String password;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.profileImageUrl,
    //required this.password,
  });

  toJson() {
    return {
      "FullName": fullName,
      "email": email,
      "Phone": phoneNo,
      "profileImageUrl":profileImageUrl
      //"Password": password,
    };
  }

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      id: doc.id,
      fullName: data['FullName'] ?? 'No Name',
      phoneNo: data['Phone'] ?? 'No Phone Number',
      email: data['email'] ?? 'No Email', profileImageUrl: data['profileImageUrl'] ?? '',
      //password: data['email'] ?? 'No Email',
    );
  }
}
