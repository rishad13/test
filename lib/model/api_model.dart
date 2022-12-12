// To parse this JSON data, do
//
//     final userInfo = userInfoFromJson(jsonString);

import 'dart:convert';

UserInfo userInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String userInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
    UserInfo({
       required this.status,
       required this.statuscode,
       required this.message,
       required this.data,
    });

    bool status;
    int statuscode;
    String message;
    List<Datum> data;

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        status: json["status"],
        statuscode: json["statuscode"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "statuscode": statuscode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
       required this.userId,
       required this.name,
       required this.profilePic,
       required this.about,
       required this.phone,
       required this.country,
       required this.companyMail,
    });

    String userId;
    String name;
    String profilePic;
    String about;
    String phone;
    String country;
    String companyMail;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        userId: json["user_id"],
        name: json["name"],
        profilePic: json["profile_pic"],
        about: json["about"],
        phone: json["phone"],
        country: json["country"],
        companyMail: json["company_mail"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "profile_pic": profilePic,
        "about": about,
        "phone": phone,
        "country": country,
        "company_mail": companyMail,
    };
}
