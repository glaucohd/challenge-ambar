import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        strokeWidth: 5.0,
      ),
    );
  }
}