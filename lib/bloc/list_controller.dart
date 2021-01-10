import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import '../constants/service_constant.dart';
import '../constants/string_constant.dart';
import '../models/user.dart';
import 'package:challenge_get_user/constants/string_constant.dart';
import 'package:challenge_get_user/models/user.dart';
import 'package:challenge_get_user/constants/service_constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class ListController implements BlocBase {
  List<User> user;
  String url;

  var streamListController = StreamController();

  Stream get outList => streamListController.stream;
  Sink get inList => streamListController.sink;

  @override
  void dispose() {
    streamListController.close();
  }

  Future<void> reloader() async {
    List listUser = await getUser();
    inList.add(listUser);
  }

  Future<List<User>> getUser() async {
    try {
      List<User> listUser = List();
      final response = await http.get(ServiceConstant.BASE_API);
      if (response.statusCode == 200) {
        var descodeJson = jsonDecode(response.body);
        descodeJson.forEach((item) => listUser.add(User.fromJson(item)));
        return listUser;
      } else {
        print(StringConstants.error);
        return null;
      }
    } catch (e) {
      print(StringConstants.error);
      return null;
    }
  }

   launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  getUrlRepository(User user) {
    var htmlUrl = user.owner.htmlUrl;
    var repository = user.name;
    url = '$htmlUrl' '/' '$repository';

    launchURL(url);
  }

  @override
  void addListener(listener) {}

  bool get hasListeners => throw UnimplementedError();

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
