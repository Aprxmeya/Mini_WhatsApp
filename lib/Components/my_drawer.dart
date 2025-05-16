import 'package:chat_app_final/auth/auth_service.dart';
import 'package:chat_app_final/pages/settingspage.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) {
    final auth = AuthService();
    auth.signout();

    // Optionally show a SnackBar or redirect
    Navigator.pop(context); // Close the drawer
    Navigator.pushReplacementNamed(context, '/login'); // Go to login screen
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[200],
      child: Column(
        children: [

          DrawerHeader(
              child: Center(
                child: Icon(Icons.message , color: Colors.grey, size:40),
              )
          ),

          Padding(
              padding:EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("HOME"),
              leading:Icon(Icons.home,color: Colors.grey,),
              onTap: () {
                // pop the drawer so you can see the home page again
                Navigator.pop(context);
              },
            ),
          ),

          Padding(
            padding:EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("SETTINGS"),
              leading:Icon(Icons.settings,color: Colors.grey,),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Settingspage() ));
                
              },
            ),
          ),

          Padding(
            padding:EdgeInsets.only(left: 25),
            child: ListTile(
              title: Text("LOGOUT"),
              leading:Icon(Icons.logout,color: Colors.grey,),
              onTap: () => logout(context),
            ),
          ),

        ],
      ),
    );
  }
}
