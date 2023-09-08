// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nuriya_tailers/constants/colors.dart';
import 'package:nuriya_tailers/features/auth/screens/auth_screen.dart';
import 'package:loading_indicator/loading_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const AuthScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: GlobalVariables.primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'নুরিয়া পাঞ্জাবি টেইলার্স এন্ড ফেব্রিকস',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: GlobalVariables.backgroundColor,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                'মাদ্রাসা পাড়া, আশ্রাফাবাদ',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: GlobalVariables.backgroundColor,
                  decoration: TextDecoration.none,
                ),
              ),
              Text(
                'কামরাঙ্গীর চর, ঢাকা',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                  color: GlobalVariables.backgroundColor,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Developed by: PNC Soft Tech',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: GlobalVariables.backgroundColor,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email:pncsofttechmail@gmail.com",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: GlobalVariables.backgroundColor,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Phone:01793278360',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: GlobalVariables.backgroundColor,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 140,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,

                  /// Required, The loading type of the widget
                  colors: [
                    Colors.red,
                    Colors.yellow,
                    Colors.blue,
                    Colors.orange,
                    Colors.green,
                    Colors.indigo,
                    Colors.purple,
                  ],

                  /// Optional, The color collections
                  strokeWidth: 1,
                ),
              )
            ],
          ),
        ));
  }
}
