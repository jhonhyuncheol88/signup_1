import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup_1/ui/home.dart';
import 'package:signup_1/utils/api.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  //해당 텍스트 필드의 값을 받아오는 함수
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  //sharedpreferences 실행하는 함수
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginwithEmail() async {
    var headers = {'Content-Type': 'application/json'};
    try {
      //url은 기존 url에 loginEmail이 함쳐진 주소
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndpoints.loginEmail);
      //이메일과 비밀번호를 Map body에 넣는다.
      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text.trim()
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

//해당 값이 200이면 토큰을 저장한다.
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        //해당 code가 0이면 토큰을 저장하고 , 1이면 message를 넘기는 방식 , 즉 로그인 하면 0, 로그인 실패는 1
        if (json['code'] == 0) {
          //토큰 값 선언
          var token = json['data']['Token'];
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString('token', token);
          emailController.clear();
          passwordController.clear();
          Get.off(HomeScreen());
        } else if (json['code'] == 1) {
          throw jsonDecode(response.body)['message'];
        } else {
          throw jsonDecode(response.body)["Message"] ?? "UnKnown Error Occured";
        }
      }
    } catch (e) {
      Get.back();
      showDialog(
          context: Get.context!,
          builder: (context) {
            return SimpleDialog(
              title: Text('Error'),
              contentPadding: EdgeInsets.all(20),
              children: [Text(e.toString())],
            );
          });
    }
  }
}
