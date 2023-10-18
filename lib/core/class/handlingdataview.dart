import 'package:flutter/material.dart';
import 'package:workiomtest/core/class/statusrequest.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? const Center(child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offlinefailure
            ? const Center(child: CircularProgressIndicator())
            : statusRequest == StatusRequest.serverfailure
                ? const Center(child: CircularProgressIndicator())
                : widget;
  }
}
