import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rememorise/utils/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2200), () {
      GoRouter.of(context).pushReplacement('/home');
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo128,
              height: 70,
            ),
            const SizedBox(height: 16),
            const Text(
              "ReMemorise",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
