import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:test1/first.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    checkConnectivity();
  }

  void checkConnectivity() async {
    List<ConnectivityResult> result =
    await Connectivity().checkConnectivity();

    if (result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi)) {

      Timer(
        const Duration(seconds: 3),
            () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FirstScreen()),
          );
        },
      );

    } else {
      showMyDialog();
    }
  }

  void showMyDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("NO INTERNET"),
          content: const Text("PLEASE CHECK YOUR INTERNET CONNECTION"),
          actions: [
            ElevatedButton(
              onPressed: () {
                exit(0);
                //Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
         child: Image.asset(
            "assets/a.png",
            width: 300,
            height: 300,
          ),
        ),

    );
  }
}
