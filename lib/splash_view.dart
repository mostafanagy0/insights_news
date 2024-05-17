// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:insights_news/core/app_colors.dart';
import 'package:insights_news/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const UploadView(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBG,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 250,
              ),
              Text('Insights News',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 30),
              Text('Stay Informed, Anytime, Anywhere.',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                  ))
            ],
          ),
        ));
  }
}
