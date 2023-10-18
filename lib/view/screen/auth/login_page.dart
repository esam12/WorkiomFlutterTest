import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/controller/auth/login_controller.dart';
import 'package:workiomtest/core/class/handlingdataview.dart';
import 'package:workiomtest/core/constant/color.dart';
import 'package:workiomtest/core/functions/validinput.dart';
import 'package:workiomtest/view/widget/auth/signup/enter_button.dart';
import 'package:workiomtest/view/widget/auth/signup/footer.dart';
import 'package:workiomtest/view/widget/auth/signup/header.dart';
import 'package:workiomtest/view/widget/auth/signup/textfiled.dart';
import 'package:workiomtest/view/widget/auth/signup/textfiled_companypage.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<LoginControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Form(
                key: controller.fromstate,
                child: LogInHomeBody(
                  controller: controller,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LogInHomeBody extends StatelessWidget {
  final LoginControllerImp controller;

  const LogInHomeBody({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30.12),
        const Header(text: "Welcome Back 😍"),
        const SizedBox(height: 80),
        CustomTextFiledTenantName(
          controller: controller,
        ),
        const SizedBox(height: 24),
        CustomTextfiledEmail(
          controller: controller,
        ),
        const SizedBox(height: 24),
        CustomTextfiledPassword(
          controller: controller,
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 30),
        CustomLogInBtn(
          controller: controller,
        ),
        const SizedBox(
          height: 139.5,
        ),
        const Footer(),
      ],
    );
  }
}

class CustomLogInBtn extends StatelessWidget {
  final LoginControllerImp controller;
  const CustomLogInBtn({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EnterButton(
        text: "LogIn",
        onPressed: () {
          controller.logIn();
        },
        color: AppColor.primarycolor);
  }
}

class CustomTextfiledPassword extends StatelessWidget {
  final LoginControllerImp controller;

  const CustomTextfiledPassword({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginControllerImp>(
      builder: (controller) => TextFiled(
          mycontroller: controller.password,
          text: "Your password",
          hint: "enter your password",
          icon: Icons.lock_open_outlined,
          seffixicon: Icons.remove_red_eye_outlined,
          valid: (val) {
            return validinput(val!, 7, 100, "password");
          },
          type: TextInputType.visiblePassword),
    );
  }
}

class CustomTextfiledEmail extends StatelessWidget {
  final LoginControllerImp controller;

  const CustomTextfiledEmail({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFiled(
      text: "Your work email",
      hint: "enter work email",
      mycontroller: controller.email,
      icon: Icons.mail_outline_outlined,
      seffixicon: Icons.cancel_outlined,
      type: TextInputType.emailAddress,
      valid: (val) {
        return validinput(val!, 6, 100, "email");
      },
    );
  }
}

class CustomTextFiledTenantName extends StatelessWidget {
  final LoginControllerImp controller;

  const CustomTextFiledTenantName({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFiledWorkSpace(
        mycontroller: controller.tenantname,
        valid: (val) {
          return validinput(val!, 5, 100, "tenantname");
        },
        text: "Your company or team name",
        hint: "Workspace name*",
        icon: Icons.groups,
        type: TextInputType.text,
        suffixtext: ".workiom.com");
  }
}
