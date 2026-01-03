import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Secondscreen extends StatelessWidget


{
@override
Widget build(BuildContext context)
{
  return Scaffold
    (
    appBar: AppBar(title:Text("second secreen"),leading: IconButton(onPressed:(){
      Navigator.pop(context);
    },
        icon: Icon(Icons.home),
        iconSize: 30),

    ),
  );
}

}