import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashController extends GetxController {
  final BuildContext context;

  SplashController({required this.context});

  @override
  void onInit() {
    super.onInit();
    debugPrint("-----SplashController");
    Future.delayed(const Duration(seconds: 3));

    navigateToHome(context: context);
  }

  void navigateToHome({required BuildContext context}) {
    context.go('/home');
  }
}
