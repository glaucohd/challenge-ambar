import 'package:flutter/material.dart';

import 'package:challenge_get_user/bloc/list_controller.dart';
import 'package:challenge_get_user/components/skeleton.dart';
import 'package:challenge_get_user/constants/color_constant.dart';
import 'package:challenge_get_user/constants/string_constant.dart';
import 'package:challenge_get_user/models/user.dart';

class ListUserPage extends StatefulWidget {

  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  ListController controller = ListController();

  @override
  Widget build(BuildContext context) {
    final List<User> user = ModalRoute.of(context).settings.arguments as List<User>;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConsntant.kprimaryColor,
        title: Text(StringConstants.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: controller.reloader,
          )
        ],
      ),
      body: StreamBuilder(
        stream: controller.litsUserOutput,
        builder: (context, snapshot) {
          return FutureBuilder(
            future: controller.getUser(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(
                    child: Skeleton(length: user.length),
                  );
                default:
                  if (snapshot.hasError)
                    return Container(
                      child: Center(
                        child: Text('Tente Novamente mais tarde..'),
                      ),
                    );
                  else
                    return RefreshIndicator(
                      onRefresh: controller.reloader,
                      child: ListView.builder(
                        itemCount: user.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 5,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          user[index].owner.avatarUrl),
                                    ),
                                    title: Text(
                                      user[index].name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    subtitle: Text(
                                      user[index].owner.login,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    onTap: () {
                                      controller.getUrlRepository(user[index]);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
              }
            },
          );
        },
      ),
    );
  }
}
