import 'package:flutter/material.dart';
import 'package:workiomtest/view/widget/auth/signup/footer.dart';

class LoginSuccessPage extends StatelessWidget {
  const LoginSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LogInSuccessHomeBody(),
    );
  }
}

class LogInSuccessHomeBody extends StatelessWidget {
  const LogInSuccessHomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 354,
        ),
        const Text(
          "Thank you for choosing",
          style: TextStyle(
              fontFamily: "Rubik-Medium",
              fontWeight: FontWeight.w700,
              fontSize: 24),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Workiom",
              style: TextStyle(
                  fontFamily: "Rubik-Medium",
                  fontWeight: FontWeight.w700,
                  fontSize: 24),
            ),
            const SizedBox(
              width: 15,
            ),
            Image.asset('assets/images/logo.png')
          ],
        ),
        const SizedBox(
          height: 310,
        ),
        const Footer()
      ],
    );
  }
}
