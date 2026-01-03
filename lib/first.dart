import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test1/Click.dart';
import 'package:test1/Radioscreen.dart';
import 'package:test1/loginpage.dart' hide Radioscreen;
import 'package:test1/second.dart';

import 'checkboxscreen.dart';

class FirstScreen extends StatelessWidget {

  Future<void> _onPopInvoked(bool didPop, BuildContext context) async {
    if (didPop) return;

    final bool confirmExit = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Exit'),
        content: const Text('Are you sure you want to exit this screen?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () => exit(0),
            child: const Text('Yes'),
          ),
        ],
      ),
    ) ?? false;

    if (confirmExit && context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) => _onPopInvoked(didPop, context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("HOME"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          automaticallyImplyLeading: false,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: const Text("LOG IN"),
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.network(
                      "https://i.pinimg.com/originals/af/e1/ef/afe1ef1ec2fc0c5d69f3778e2cedf6df.png",
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: 120,
                      color: Colors.black12,
                      padding: const EdgeInsets.all(5),
                      child: const Text(
                        "VIRAT KOHLI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                Image.network(
                  "https://tse1.explicit.bing.net/th/id/OIP.xWHIMb7vVpX4Quor_PzdvwAAAA?pid=ImgDet",
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "ROHIT SHARMA",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                Image.network(
                  "https://crictoday.com/wp-content/uploads/2023/02/hardik-pandya-t20wc22-3.png",
                  height: 100,
                  width: 100,
                ),
                const Text(
                  "HARDIK PANDYA",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.brown,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "HELLO USER WELCOME TO MY PAGE",
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Secondscreen()),
                    );
                  },
                  child: const Text("Done"),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Clickscreen()),
                    );
                  },
                  child: const Text("Try it"),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
