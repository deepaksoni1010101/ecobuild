import 'dart:async';

import 'package:ecobuild/constants/constants.dart';
import 'package:ecobuild/screens/homescreen.dart';
import 'package:ecobuild/screens/login.dart';
import 'package:ecobuild/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.deepOrange,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 250.h),
                Text('Ecobuild',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 44.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 250.h),
                const CircularProgressIndicator(
                  color: Colors.white,
                ),
              ]),
        ),
      ),
    );
  }
}
