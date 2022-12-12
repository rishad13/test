import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test__api/model/api_model.dart';
String api="http://ec2-3-143-158-60.us-east-2.compute.amazonaws.com/api/get_all_user_details";

  String avathar ="";
  String name="";
  String message="";
Future<UserInfo> getHomeScreenData() async {
  final response = await http.post(Uri.parse(api),body: {"user_id": "53", "accessToken": "e43f7cb369aaa442a870cfc051a76efb"});
  if (response.statusCode == 200) {
    final data =UserInfo.fromJson(jsonDecode(response.body));
     return data;
  } else {
    throw Exception("failed to load data");
  }
}
