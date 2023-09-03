import 'package:signup_1/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:signup_1/controllers/registeration_controller.dart';

class AuthScreen extends GetView<RegisterionController> {
  AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            Text('Welcome'),
            SizedBox(height: 20),
            buttonRow(),
            SizedBox(height: 80),
            controller.islogin.value
                ? Obx(() => loginWidget())
                : Obx(
                    () => registerWidget(),
                  ),
          ],
        ),
      )),
    );
  }

  Widget buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
            child: Text('Register'),
            color: controller.islogin.value ? Colors.white : Colors.amber,
            onPressed: () => controller.islogin.value = false),
        MaterialButton(
            child: Text('Login'),
            color: controller.islogin.value ? Colors.amber : Colors.white,
            onPressed: () => controller.islogin.value = true),
      ],
    );
  }

  Widget customTextField({
    required TextEditingController controller,
    required String hintText,
  }) {
    return Container(
      height: 46,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          alignLabelWithHint: true,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          fillColor: Colors.white54,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.only(bottom: 15),
          focusColor: Colors.white60,
        ),
      ),
    );
  }

  Widget registerWidget() {
    return Column(
      children: [
        customTextField(controller: controller.nameController, hintText: '이름'),
        SizedBox(height: 20),
        customTextField(
            controller: controller.emailController, hintText: '이메일'),
        SizedBox(height: 20),
        customTextField(
            controller: controller.passwordController, hintText: '비밀번호'),
        SizedBox(height: 20),
        MaterialButton(
            child: Text('Register'), onPressed: controller.registerWithEmail)
      ],
    );
  }

  Widget loginWidget() {
    final loginController = Get.find<LoginController>();
    return Column(
      children: [
        customTextField(
            controller: controller.emailController, hintText: '이메일'),
        SizedBox(height: 20),
        customTextField(
            controller: controller.passwordController, hintText: '비밀번호'),
        SizedBox(height: 20),
        MaterialButton(
            child: Text('Login'), onPressed: loginController.loginwithEmail)
      ],
    );
  }
}
