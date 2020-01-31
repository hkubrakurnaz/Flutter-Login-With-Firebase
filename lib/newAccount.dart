import 'package:flutter/material.dart';

class newAccount extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return AccountOperations();
  }
}
class AccountOperations extends State<newAccount>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            new Image(
              image: new AssetImage("images/iskele.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
            ),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(
                  size: 120.0,
                ),
                emailTextField(),
                passwordTextField("Enter your password"),
                passwordTextField("Confirm password"),
                signUpButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget passwordTextField(String s) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 12, left: 12),
      child: TextField(

        keyboardType: TextInputType.text,
        obscureText: true,
        maxLines: 1,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 4),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Colors.blueGrey),
          hintText: s,
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 12, left: 12),
      child: new TextField(
        keyboardType: TextInputType.emailAddress,
        maxLines: 1,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 12),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 4),
          ),
          prefixIcon: Icon(
            Icons.email,
            color: Colors.blueGrey,
          ),
          hintText: 'Enter your email',
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
      ),
    );
  }
  Widget signUpButton() {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
      child: new RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          color: Colors.blueAccent,
          onPressed: () {}),
    );
  }
}
