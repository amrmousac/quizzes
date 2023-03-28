import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:quizzes/app/components/app_text.dart';
import 'package:quizzes/app/modules/registeration/views/components/login_form.dart';
import 'package:quizzes/app/modules/registeration/views/components/signup_form.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../controllers/registeration_controller.dart';

class RegisterationView extends GetView<RegisterationController> {
  const RegisterationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDesktop = getValueForScreenType<bool>(
      context: context,
      mobile: false,
      tablet: false,
      desktop: true,
    );
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: double.infinity,
            ),
            child: IntrinsicHeight(
              child: Center(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/techhub-logo.png",
                                    width: 100,
                                    filterQuality: FilterQuality.high,
                                  ),
                                  AppText(
                                    "Privacy Policy",
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16.0,
                            ),
                            Obx(
                              () => Expanded(
                                child: controller.isLogin.value
                                    ? LoginForm(controller: controller)
                                    : SignupForm(controller: controller),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AppText(
                                  'Copyright © 2023 Tech-hub. All rights reserved'),
                            )
                          ],
                        ),
                      ),
                    ),
                    if (isDesktop)
                      Expanded(
                        flex: 3,
                        child: Image.asset(
                          "assets/images/bg.webp",
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
