import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/images/Keylogo.png", fit: BoxFit.contain,)

          ),
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
                    print("Tech Chart");
                  },
                  child: Text("Log In"),
                style: TextButton.styleFrom(),
              ),
            ],),
          )

        ],
      )
    );
  }
}

// textScaleFactor: 2.0,),