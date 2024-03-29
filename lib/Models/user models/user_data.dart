// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  String? userId;
  String? userName;
  String? firstName;
  String? lastName;
  String? gothram;
  String? gender;
  String? address;
  String? mobileNumber;
  String? avatar;
  String? profileStatus;

  UserData({
    this.userId,
    this.userName,
    this.firstName,
    this.lastName,
    this.gender,
    this.address,
    this.gothram,
    this.mobileNumber,
    this.avatar,
    this.profileStatus = '57%',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': userId,
      'userName': userName,
      'firstName': firstName,
      'lastName': lastName,
      'gender': gender,
      'address': address,
      'mobileNumber': mobileNumber,
      'gothram': gothram,
      'avatar': avatar,
      'profileStatus': profileStatus,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      userId: map['_id'] != null ? map['_id'] as String : null,
      userName: map['userName'] != null ? map['userName'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      mobileNumber: map['mobileNumber'].toString(),
      gothram: map['gothram'].toString(),
      avatar: map['avatar'].toString(),
      profileStatus: map['profileStatus'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(userId: $userId, userName: $userName, firstName: $firstName, lastName: $lastName, gender: $gender, address: $address, mobileNumber:$mobileNumber, gothram:$gothram, avatar:$avatar, profileStatus:$profileStatus)';
  }
}

UserData newUser = UserData();
