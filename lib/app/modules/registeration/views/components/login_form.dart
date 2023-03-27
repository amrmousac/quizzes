import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/components/gradient_text.dart';
import 'package:quizzes/app/modules/registeration/controllers/registeration_controller.dart';
import 'package:quizzes/app/routes/app_pages.dart';

import 'package:reactive_forms/reactive_forms.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, required this.controller});
  final RegisterationController controller;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: controller.form,
      child: Container(
        padding: EdgeInsets.all(8.0),
        constraints: BoxConstraints(
            // maxWidth: 400,
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(
              "Welcome Admin!",
              style: TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.bold,
              ),
            ),
            AppText("Enter your email & password to login"),
            SizedBox(
              height: 16.0,
            ),
            AppText(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ReactiveTextField(
              formControlName: "email",
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            AppText(
              "password",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            ReactiveTextField(
              formControlName: "password",
              decoration: InputDecoration(
                hintText: 'password',
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 16.0,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(Routes.HOME);
                },
                style: ButtonStyle(
                  padding: MaterialStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  ),
                ),
                child: AppText(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
