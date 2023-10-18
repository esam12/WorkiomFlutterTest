import 'package:flutter/material.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/view/screen/auth/work_space_page.dart';
import 'package:workiomtest/view/screen/auth/login_page.dart';
import 'package:workiomtest/view/screen/auth/signup.dart';
import 'package:workiomtest/view/screen/auth/strong_password.dart';
import 'package:workiomtest/view/screen/login_success_page.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //Auth
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.signUp_strongPassword: (context) => const StrongPassword(),
  AppRoute.signUp_companyName: (context) => const WorkSpacePage(),
  AppRoute.logIn: (context) => const LogInPage(),
  AppRoute.loginSuccessPage: (context) => const LoginSuccessPage(),
};
