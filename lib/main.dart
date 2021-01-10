import 'package:challenge_get_user/components/splash_screen.dart';
import 'package:flutter/material.dart';
import './utils/routes.dart';
import './pages/list_user_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avaliação Técnica - Ambar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      routes: {
        Routes.LIST_USER: (context) => ListUserPage(),
      },
    );
  }
}
