// ignore_for_file: prefer_const_constructors, unused_import

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:new_project/UsersList.dart';
import 'package:new_project/login.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
//import 'firebase';

import 'Chat.dart';
// import 'package:flutter/material.dart';
// import 'package:signal_ui/constants.dart';
// import 'package:signal_ui/screens/new_message.dart';
// import 'package:signal_ui/screens/settings.dart';
// import 'package:signal_ui/widgets/chat.dart';

// import 'chat_screen.dart';

Future<void> main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initialize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({Key? key}) : super(key: key);

  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00000A),
      appBar: AppBar(
        backgroundColor: Color(0xFF000000),
        title: const Text(
          "Signal",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.w900, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
              child: Center(
                  child: SizedBox(
                width: 200,
                height: 150,
                /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 300,
                  child: CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('.idea/asset/images/Signal.png')),
                ),
              )),
            ),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
              ),
            ),
            const Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Password',
                    hintText: 'Enter secured password!'),
              ),
            ),
            // TextButton(
            //   onPressed: () {
            //     //TODO FORGOT PASSWORD SCREEN GOES HERE
            //   },
            //   child: const Text(
            //     'Forgot Password?',
            //     style: TextStyle(color: Colors.blue, fontSize: 15),
            //   ),
            // ),

            Container(
              height: 35,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color(0XFF0D47A1), fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}

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
                  icon: const Icon(Icons.logout_outlined, size: 30),
                  color: const Color(0xFFFFFFFF),
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Chat()));
                  },
                  heroTag: null,
                )
              ],
            ),
          ),
        ));
  }
}
