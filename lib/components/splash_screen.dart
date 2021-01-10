import 'package:challenge_get_user/bloc/list_controller.dart';
import 'package:challenge_get_user/models/user.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<User> user;
  ListController controller = ListController();

  @override
  void initState() {
    super.initState();
    controller.getUser().then((map) {
      user = map;
    });
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushNamed(Routes.LIST_USER, arguments: user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.asset(
            'assets/images/logo_github.png',
            height: 250,
          ),
        ),
      ),
    );
  }
}
