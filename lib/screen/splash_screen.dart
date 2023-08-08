import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/constants/app_colors.dart';
import 'package:my_bmi_calculator/routes/routes.dart';
import 'package:my_bmi_calculator/screen/input_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, RouteGenerator.inputPage);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.cetaceanBlue,
            body: Column(
              children: [
                Image.asset(
                  'assets/images/splash_logo.png',
                  width: 125,
                ),
                const SizedBox(
                  height: 30,
                  width: double.infinity,
                ),
                const Text(
                  'BMI CALCULATOR',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 300,
                ),
                const CircularProgressIndicator(
                  color: Color(0xffFF0C63),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Check Your BMI",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
