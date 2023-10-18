import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/controller/auth/work_space_controller.dart';
import 'package:workiomtest/core/class/handlingdataview.dart';
import 'package:workiomtest/core/constant/color.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/core/functions/validinput.dart';
import 'package:workiomtest/view/widget/auth/signup/enter_button.dart';
import 'package:workiomtest/view/widget/auth/signup/footer.dart';
import 'package:workiomtest/view/widget/auth/signup/header.dart';
import 'package:workiomtest/view/widget/auth/signup/textfiled_companypage.dart';
import 'package:workiomtest/view/widget/auth/signup/toolbar.dart';

class WorkSpacePage extends StatelessWidget {
  const WorkSpacePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreateWorkSpaceImp());
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CreateWorkSpaceImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: SingleChildScrollView(
              child: Form(
                key: controller.fromstate,
                child: WorkSpaceHomeBody(controller: controller),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WorkSpaceHomeBody extends StatelessWidget {
  final CreateWorkSpaceImp controller;

  const WorkSpaceHomeBody({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Toolbar(
          text: "",
          onPressed: () {
            Get.offNamed(AppRoute.signUp_strongPassword);
          },
        ),
        const SizedBox(height: 30.12),
        const Header(text: "Enter your company name"),
        const SizedBox(height: 80),
        CustomTextfiledTenantName(controller: controller),
        const SizedBox(height: 24),
        CustomTextfiledFirstName(controller: controller),
        const SizedBox(height: 24),
        CustomTextfiledLastName(controller: controller),
        const SizedBox(height: 28),
        CustomCreateWorkSpaceBrn(controller: controller),
        const SizedBox(height: 139.5),
        const Footer()
      ],
    );
  }
}

class CustomTextfiledTenantName extends StatelessWidget {
  final CreateWorkSpaceImp controller;
  const CustomTextfiledTenantName({
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

class CustomTextfiledFirstName extends StatelessWidget {
  final CreateWorkSpaceImp controller;

  const CustomTextfiledFirstName({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFiledWorkSpace(
      mycontroller: controller.firsname,
      text: "Your first name",
      hint: "Enter your name",
      icon: Icons.menu,
      type: TextInputType.text,
      suffixtext: "",
      valid: (val) {
        return validinput(val!, 3, 100, "text");
      },
    );
  }
}

class CustomTextfiledLastName extends StatelessWidget {
  final CreateWorkSpaceImp controller;

  const CustomTextfiledLastName({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFiledWorkSpace(
      mycontroller: controller.lastname,
      text: "Your last name",
      hint: "Enter your name",
      icon: Icons.menu,
      type: TextInputType.text,
      suffixtext: "",
      valid: (val) {
        return validinput(val!, 3, 100, "text");
      },
    );
  }
}

class CustomCreateWorkSpaceBrn extends StatelessWidget {
  final CreateWorkSpaceImp controller;

  const CustomCreateWorkSpaceBrn({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return EnterButton(
        text: "Create Workspace",
        onPressed: () {
          controller.registerTenant();
        },
        color: AppColor.enterbuttonsecondcolor);
  }
}
