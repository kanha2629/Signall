// ignore: file_names
import 'package:flutter/material.dart';

// https://github.com/MarcusNg/flutter_chat_ui
class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {Navigator.of(context).pop()},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CircleAvatar(
                  child: Image.network(
                      "https://gravatar.com/avatar/db92b2913ebf7a0e67001a5b5185bd81?s=400&d=robohash&r=x"),
                ),
              ),
              const Text(
                "Piyu",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.video_call),
              onPressed: () {},
            ),
            const Icon(Icons.call),
            const Icon(Icons.more_vert)
          ],
          backgroundColor: Colors.pink,
        ),
        body: ListView(children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 137,
                child: Center(
                    child: ListView.builder(
                        itemCount: 1000,
                        itemBuilder: (context, i) {
                          if (i == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Image.network(
                                        "https://gravatar.com/avatar/db92b2913ebf7a0e67001a5b5185bd81?s=400&d=robohash&r=x"),
                                    radius: 50.0,
                                  ),
                                  const Text(
                                    "Piyu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  const Text("+919876543110")
                                ],
                              ),
                            );
                          } else {
                            if (i % 2 == 0) {
                              return leftChat("i" * i);
                            } else {
                              return rightChat(context, "i" * i);
                            }
                          }
                        })),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.only(bottom: 0.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      child: const TextField(
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.send),
                      backgroundColor: Colors.red,
                      onPressed: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ]));
  }
}

Widget leftChat(String text) {
  return Row(
    children: [
      CircleAvatar(
        child: Image.network(
            "https://gravatar.com/avatar/db92b2913ebf7a0e67001a5b5185bd81?s=400&d=robohash&r=x"),
        radius: 20.0,
      ),
      Container(
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
        padding: const EdgeInsets.all(5.0),
        height: 30.0,
        width: text.length.toDouble() + 20.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: Colors.red[200]),
        child: Text(
          text,
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );
}

Widget rightChat(context, String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0),
        height: 30.0,
        width: text.length.toDouble() + 20.0,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
            color: Colors.black26),
        child: Text(
          text,
          textAlign: TextAlign.right,
        ),
      ),
      CircleAvatar(
        backgroundColor: Colors.red,
        child: Image.network(
            "https://gravatar.com/avatar/db92b2913ebf7a0e67001a5b5185bd81?s=400&d=robohash&r=x"),
      )
    ],
  );
}
