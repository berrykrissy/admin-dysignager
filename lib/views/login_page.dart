import 'package:flutter/material.dart';
import 'package:signage/controllers/login_controller.dart';
import 'package:signage/views/base_view.dart';
import 'package:signage/widgets/button_widget.dart';
import 'package:signage/widgets/text_field_widget.dart';

class LoginPage extends BaseView<LoginController> {

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold (
      backgroundColor: Colors.white,
      body: SingleChildScrollView (
        child: Column (
          children: <Widget> [
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center (
                child: FlutterLogo(),
              ),
            ),
            Padding (
              padding: const EdgeInsets.only(top: 15, left: 30.0, right: 30.0,),
              child: TextFieldWidget (
                textEditingController: controller.usernameController,
                labelText: 'Username',
                hintText: 'Enter valid Username'
              ),
            ),
            Padding (
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 15, bottom: 15),
              child: TextFieldWidget(
                textEditingController: controller.passwordController,
                isObscureText: true,
                labelText: 'Password',
                hintText: 'Enter secure password'
              ),
            ),
            ButtonWidget (
              text: "Login", 
              onPressed: () {
                controller.checkCredentials();
              },
            ),
          ]
        ),
      ),
    );
  }
}