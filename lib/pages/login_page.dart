import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tech_cart/utils/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
    String name = "";
    bool isChanged = false;
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
                Text("Welcome $name",
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
                      // to reflect the change in the state to the Welcome text
                      onChanged: (value){
                        name = value;
                        setState(() {});
                      },
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

                    // Animated Container (Button)
                    InkWell(
                      onTap: () async{
                        setState(() {
                          isChanged = true;
                        });
                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: isChanged ? 50 : 200,
                        height: 50,
                        // color: Colors.deepPurple,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(isChanged ? 50 : 10),
                        ),
                        child:isChanged? Icon(Icons.done, color: Colors.white,): Text(
                          "Log In",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: GoogleFonts.lato().fontFamily,
                              color: Colors.white,),
                        ),

                      ),
                    ),
                    // ElevatedButton(
                    //     onPressed:() {
                    //       Navigator.pushNamed(context, MyRoutes.homeRoute);
                    //       // print("Tech Chart");
                    //     },
                    //     child: Text("Log In"),
                    //   style: TextButton.styleFrom(minimumSize: Size(200, 50)),
                    // ),
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