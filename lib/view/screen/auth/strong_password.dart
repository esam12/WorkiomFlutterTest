import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/controller/auth/strongpassword_controller.dart';
import 'package:workiomtest/core/constant/color.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/core/functions/validinput.dart';
import 'package:workiomtest/view/widget/auth/signup/enter_button.dart';
import 'package:workiomtest/view/widget/auth/signup/footer.dart';
import 'package:workiomtest/view/widget/auth/signup/header.dart';
import 'package:workiomtest/view/widget/auth/signup/textfiled.dart';
import 'package:workiomtest/view/widget/auth/signup/toolbar.dart';

class StrongPassword extends StatelessWidget {
  const StrongPassword({super.key});

  @override
  Widget build(BuildContext context) {
    StrongPasswordControllerImp controller =
        Get.put(StrongPasswordControllerImp());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: controller.fromstate,
            child: StrongPasswordHomeBody(controller: controller),
          ),
        ),
      ),
    );
  }
}

class StrongPasswordHomeBody extends StatelessWidget {
  const StrongPasswordHomeBody({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Toolbar(
          text: "",
          onPressed: () {
            Get.offNamed(AppRoute.signUp);
          },
        ),
        const SizedBox(height: 30.12),
        const Header(text: "Enter a strong password"),
        const SizedBox(height: 80),
        CustomTextFiledForEmail(controller: controller),
        const SizedBox(height: 24),
        const CustomTextFiledForPassword(),
        const SizedBox(height: 16),
        Obx(
          () => Column(
            children: [
              CustomLinearProgressIndicator(controller: controller),
              const SizedBox(height: 9),
              CustomCheckPasswordNotEnought(controller: controller),
              const SizedBox(
                height: 10,
              ),
              CustomCheckPasswordToHaveCharacters(controller: controller),
              const SizedBox(height: 10),
              CustomCheckPasswordToHaveUpperCase(controller: controller),
              const SizedBox(height: 30),
              CustomConfirmPasswordBtn(controller: controller),
            ],
          ),
        ),
        const SizedBox(
          height: 139.5,
        ),
        const Footer(),
      ],
    );
  }
}

class CustomTextFiledForPassword extends StatelessWidget {
  const CustomTextFiledForPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StrongPasswordControllerImp>(
      builder: (controller) => TextFiled(
          onChanged: (p0) {
            controller.checkPasswordStregth(p0);
          },
          mycontroller: controller.passwordtext,
          text: "Your password",
          hint: "enter your password",
          obscureText: controller.isShowPass,
          icon: Icons.lock_open_outlined,
          seffixicon: Icons.remove_red_eye_outlined,
          onTapIcon: () {
            controller.showPassword();
          },
          valid: (val) {
            return validinput(val!, 7, 100, "password");
          },
          type: TextInputType.visiblePassword),
    );
  }
}

class CustomTextFiledForEmail extends StatelessWidget {
  const CustomTextFiledForEmail({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

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

class CustomConfirmPasswordBtn extends StatelessWidget {
  const CustomConfirmPasswordBtn({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return EnterButton(
      text: "Confirm password",
      onPressed: () {
        controller.signUp();
      },
      color: controller.passwordStrength.value == 1
          ? AppColor.primarycolor
          : AppColor.enterbuttonsecondcolor,
    );
  }
}

class CustomCheckPasswordToHaveUpperCase extends StatelessWidget {
  const CustomCheckPasswordToHaveUpperCase({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 20,
            height: 20,
            child: Center(
              child: Icon(
                controller.passwordStrength.value == 2
                    ? Icons.close
                    : controller.passwordStrength.value == 1
                        ? Icons.check
                        : Icons.close,
                color: controller.passwordStrength.value == 0
                    ? Colors.white
                    : controller.passwordStrength.value == 2
                        ? Colors.red
                        : controller.passwordStrength.value == 1
                            ? Colors.green
                            : Colors.red,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Passwords must have at least one uppercase ('A'-'Z').",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class CustomCheckPasswordToHaveCharacters extends StatelessWidget {
  const CustomCheckPasswordToHaveCharacters({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 20,
            height: 20,
            child: Center(
              child: Icon(
                controller.passwordStrength.value == 2
                    ? Icons.close
                    : controller.passwordStrength.value == 1 / 3
                        ? Icons.close
                        : Icons.check,
                color: controller.passwordStrength.value == 2
                    ? Colors.red
                    : controller.passwordStrength.value == 0
                        ? Colors.white
                        : controller.passwordStrength.value == 1 / 3
                            ? Colors.red
                            : Colors.green,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Passwords must have at least 7 characters",
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class CustomCheckPasswordNotEnought extends StatelessWidget {
  const CustomCheckPasswordNotEnought({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: 20,
            height: 20,
            child: Center(
              child: Icon(
                controller.passwordStrength.value == 2
                    ? Icons.close
                    : controller.passwordStrength.value == 2 / 3
                        ? Icons.warning_amber_rounded
                        : Icons.check,
                color: controller.passwordStrength.value == 2
                    ? Colors.red
                    : controller.passwordStrength.value == 0
                        ? Colors.white
                        : controller.passwordStrength.value == 2 / 3
                            ? Colors.amber
                            : Colors.green,
                size: 15,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Not enought strong",
            style: TextStyle(fontFamily: "Rubik"),
          )
        ],
      ),
    );
  }
}

class CustomLinearProgressIndicator extends StatelessWidget {
  const CustomLinearProgressIndicator({
    super.key,
    required this.controller,
  });

  final StrongPasswordControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(4)),
        child: LinearProgressIndicator(
          value: controller.passwordStrength.value,
          backgroundColor: Colors.grey[300],
          color: controller.passwordStrength.value == 1 / 3
              ? Colors.red
              : controller.passwordStrength.value == 2 / 3
                  ? Colors.amber
                  : controller.passwordStrength.value == 1
                      ? Colors.green
                      : controller.passwordStrength.value == 2
                          ? Colors.red
                          : Colors.grey[300],
        ),
      ),
    );
  }
}
