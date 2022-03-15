// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UsersList.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0,
              title: const Text(
                "Signal",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFFFFFFFF)),
              ),
              // ignore: prefer_const_literals_to_create_immutables
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.search, size: 30),
                  color: const Color(0xFFFFFFFF),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert, size: 30),
                  color: const Color(0xFFFFFFFF),
                  onPressed: () {},
                )
              ],
            ),
            body: const UsersList(),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                FloatingActionButton(
                  child: const Icon(
                    Icons.camera_alt,
                    color: Colors.white60,
                  ),
                  onPressed: () {},
                  heroTag: null,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(
                  height: 12,
                ),
                FloatingActionButton(
                  child: const Icon(
                    Icons.edit,
                  ),
                  onPressed: () {},
                  heroTag: null,
                )
              ],
            ),
          ),
        ));
  }
}
