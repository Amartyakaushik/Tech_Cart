import 'package:flutter/material.dart';
import 'package:tech_cart/utils/MyRoutes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                  Image.asset("assets/images/Keylogo.png", fit: BoxFit.contain, height: 200,),
                SizedBox(
                  height: 40,
                ),
                Text("Welcome",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName"
                      ),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "Password"
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed:() {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                          // print("Tech Chart");
                        },
                        child: Text("Log In"),
                      style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                    ),
                  ],),
                )

              ],
            ),
          ],
        ),
      )
    );
  }
}

// textScaleFactor: 2.0,),