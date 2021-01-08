import 'package:challenge_get_user/bloc/list_user_bloc.dart';
import 'package:challenge_get_user/components/custom_circular_progress.dart';
import 'package:challenge_get_user/constants/color_constant.dart';
import 'package:challenge_get_user/constants/string_constant.dart';
import 'package:challenge_get_user/models/user.dart';
import 'package:flutter/material.dart';

class ListUserPage extends StatefulWidget {
  @override
  _ListUserPageState createState() => _ListUserPageState();
}

class _ListUserPageState extends State<ListUserPage> {
  final _bloc = ListUserBloc();
  List<User> user;
  String url;

  @override
  void initState() {
    super.initState();

    _bloc.getUser().then((map) {
      user = map;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConsntant.kprimaryColor,
        title: Text(StringConstants.title),
      ),
      body: FutureBuilder(
        future: _bloc.getUser(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(
                child: CustomCircularProgress(),
              );
            default:
              if (snapshot.hasError)
                return Container(
                child: Center(
                  child: Text('Tente Novamente mais tarde..'),
                ),
                );
              else
                return ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(user[index].owner.avatarUrl),
                        ),
                        title: Text(
                          user[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Text(
                          user[index].owner.login,
                          style: TextStyle(fontSize: 15),
                        ),
                        onTap: () {
                          _bloc.getUrlRepository(user[index]);
                        },
                      ),
                    );
                  },
                );
          }
        },
      ),
    );
  }
}
