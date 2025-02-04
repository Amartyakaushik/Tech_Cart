import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        // color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    accountName: Text("Amartya Kaushik"),
                    accountEmail: Text("kamartya20@gmail.com"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/profile.png"),
                        // debugPrint("Loading image: assets/images/profile.png"),
                    ),
                    ),
            ),
            ListTile(
              leading: Icon(
                  CupertinoIcons.home,
                  color: Colors.black,),
              title: Text("Home",
                    textScaler:  TextScaler.linear(1.2),
                    style: TextStyle(color: Colors.black),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,),
              title: Text("Profile",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(color: Colors.black),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.black,),
              title: Text("Email",
                textScaler: TextScaler.linear(1.2),
                style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }
}
