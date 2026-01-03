import 'package:flutter/material.dart';
import 'package:test1/main.dart';

class LanguageScreen extends StatefulWidget {
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  List<String> language = [
    "JAVA",
    "PHP",
    "HTML",
    "DART",
    "C++",
    "C",
    "PYTHON",
    "C#"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Languages"),
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Image.network(
              "https://p7.hiclipart.com/preview/321/970/459/programming-language-computer-programming-java-programacion.jpg",
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(10),
              itemCount: language.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.brown.shade400,
                  child: Center(
                    child: Text(
                      language[index],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

    );
  }
}
