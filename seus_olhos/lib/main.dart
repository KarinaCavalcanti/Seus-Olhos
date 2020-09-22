import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';
import 'package:seus_olhos/pages/home_page.dart';
import 'package:seus_olhos/pages/onboarding_page.dart';
import 'package:seus_olhos/pages/PaginaPrincipal.dart';
import 'package:seus_olhos/pages/ajuda.dart';
import 'package:seus_olhos/pages/response.dart';
import 'package:seus_olhos/pages/sobre_nos.dart';

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
        AppRoutes.PRINCIPAL_PAGE: (_) => PagePrincipal(),
        AppRoutes.AJUDA_PAGE: (_) => Ajuda(),
        AppRoutes.SOBRE_PAGE: (_) => SobreNos(),
        AppRoutes.RESPOSTA_PAGE: (_) => Response(),
      },
    ),
  );
}
