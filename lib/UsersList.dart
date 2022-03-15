// ignore: duplicate_ignore
import 'package:http/http.dart' as http;
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/models/Models.dart';

import 'dart:convert';

class UsersList extends StatelessWidget {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SignalList(
      title: '',
    );
  }
}

// ignore: unnecessary_new, unnecessary_new
class SignalList extends StatefulWidget {
  const SignalList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignalListState createState() => _SignalListState();
}

class _SignalListState extends State<SignalList> {
  Future<List<User>> _getUsers() async {
    // ignore: unused_local_variable
    var data =
        await http.get("https://jsonplaceholder.typicode.com/users" as Uri);

    var jsonData = json.decode(data.body);

    List<User> users = [];
    for (var u in jsonData) {
      User user = User(u['id'], u['name']);

      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() => Colors.primaries[4];

    return FutureBuilder(
      future: _getUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("Loading...."),
          );
        } else {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                splashColor: getRandomColor(),
                child: Ink(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: getRandomColor(),
                      child: Text(snapshot.data[index].name
                          .substring(0, 2)
                          .toUppercase()),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
