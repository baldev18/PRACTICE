import 'package:flutter/material.dart';
import 'package:test1/display.dart';
import 'package:test1/Radioscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
enum Gender {male,female}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController uname = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Gender _gender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGIN"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: uname,
                  decoration: const InputDecoration(
                    hintText: "Enter Username",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Username";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 15),

                TextFormField(
                  controller: pass,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),


                ListTile
                  (
                  title: Text("Male"),
                  leading:Radio(value: Gender.male, groupValue: _gender, onChanged:(value)
                  {
                    setState(() {
                      _gender = value!;
                    });

                  }),
                ),
                ListTile
                  (
                  title: Text("Female"),
                  leading:Radio(value: Gender.female, groupValue: _gender, onChanged:(value)
                  {
                    setState(() {
                      _gender = value!;
                    });
                  }),
                ),


                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String myUname = uname.text.trim();
                      String myPass = pass.text.trim();

                      if (myUname == "BALDEVSINH" && myPass == "1718") {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Success")),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DisplayScreen(username: myUname),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Login Failed")),
                        );
                      }
                    }
                  },
                  child: const Text("Login"),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

