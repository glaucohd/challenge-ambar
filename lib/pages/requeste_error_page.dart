import 'package:challenge_get_user/constants/color_constant.dart';
import 'package:challenge_get_user/constants/string_constant.dart';
import 'package:challenge_get_user/controllers/list_controller.dart';
import 'package:flutter/material.dart';

class RequestErrorPage extends StatelessWidget {
  final ListController controller = ListController();

  final Function function;
  RequestErrorPage({
    Key key,
    this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/pet_github.png'),
          SizedBox(height: 10),
          Text(
            StringConstants.errorConnection,
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(StringConstants.sorryErrorPage, style: TextStyle(fontSize: 16)),
          Text(StringConstants.limitedRequest, style: TextStyle(fontSize: 16)),
          SizedBox(height: 20),
          Text(StringConstants.tryLate,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Center(
            child: StreamBuilder(
              stream: controller.litsUserOutput,
              builder: (context, snapshot) {
                return Container(
                  width: double.infinity,
                  height: 45,
                  child: RaisedButton(
                    color: ColorConsntant.buttonColor,
                    child: Text(
                      StringConstants.tryAgain,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
