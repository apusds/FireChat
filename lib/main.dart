import 'package:firestore_chat/custom_button.dart';
import 'package:firestore_chat/pages/chat.dart';
import 'package:firestore_chat/pages/login.dart';
import 'package:firestore_chat/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FireChat',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        Register.id: (context) => Register(),
        Login.id: (context) => Login(),
        Chat.id: (context) => Chat()
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const String id = 'homescreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  width: 100.0,
                  child: Image.asset('assets/images/tensor.png'),
                ),
              ),
              Text(
                "FireChat",
                style: TextStyle(
                  fontSize: 40.0,
                ),
              )
            ],
          ),
          SizedBox(
            height: 50.0,
          ),
          CustomButton(
            text: "Login",
            callback: () {
              Navigator.of(context).pushNamed(Login.id);
            },
          ),
          CustomButton(
            text: "Register",
            callback: () {
              Navigator.of(context).pushNamed(Register.id);
            },
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            "By APU Student Developer Society",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          InkWell(
            child: Text(
              "Visit us at https://apusds.com",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
            onTap: () {
              launch('https://apusds.com');
            },
          ),
        ],
      ),
    );
  }
}
