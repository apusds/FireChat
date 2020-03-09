import 'package:firebase_auth/firebase_auth.dart';
import 'package:firestore_chat/custom_button.dart';
import 'package:firestore_chat/pages/chat.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String id = 'register';

  Register({Key key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password,
    )).user;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => Chat(user: user),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FireChat'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset("assets/images/tensor.png"),
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) => email = value,
                  decoration: InputDecoration(
                    hintText: 'Enter your Email...',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  autocorrect: false,
                  obscureText: true,
                  onChanged: (value) => password = value,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password...',
                    border: OutlineInputBorder(),
                  ),
                ),
                CustomButton(
                  text: "Register",
                  callback: () async {
                    await registerUser();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
