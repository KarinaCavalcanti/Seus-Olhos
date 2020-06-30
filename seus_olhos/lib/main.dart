import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';
import 'package:seus_olhos/pages/home_page.dart';
import 'package:seus_olhos/pages/onboarding_page.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Seus Olhos",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME_PAGE: (_) => HomePage(),
        AppRoutes.INT_PAGE: (_) => OnboardingPage(),
      },
    ),
  );
}

