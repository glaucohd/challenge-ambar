import 'package:challenge_get_user/controllers/list_controller.dart';
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
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacementNamed(Routes.LIST_USER, arguments: user);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo_github.png',
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: LinearProgressIndicator(
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
