import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlashScreen extends StatelessWidget {
  const SlashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isPhone
                  ? 40
                  : context.isLandscape
                      ? 300
                      : 150,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/ibc_logo.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
