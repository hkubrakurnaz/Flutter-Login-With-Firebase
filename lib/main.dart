import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_operations/register.dart';
import 'package:flutter_login_operations/newAccount.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InputIslemleri();
  }
}

class InputIslemleri extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        backgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: LoginEkrani(),
      ),
    );
  }
}

class LoginEkrani extends StatelessWidget{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final emailcontrol = TextEditingController();
  final passwordcontrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Image(
          image: new AssetImage("images/iskele.jpg"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),

        Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                showLogo(),
                emailTextField(),
                passwordTextField(),
                loginButton(context),
                newAccountButton(context),
              ],
            ),
          ),
        )
      ],
    );
  }
  Widget showLogo() {
    return new FlutterLogo(
      size: 120.0,
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 12, left: 12),
      child: new TextField(

        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
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
          hintText: 'Email',
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        controller: emailcontrol,
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 12, left: 12, bottom: 16),
      child: TextField(

        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        keyboardType: TextInputType.text,
        obscureText: true,
        maxLines: 1,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 12,color: Colors.white),

          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 4),
          ),
          prefixIcon: Icon(Icons.vpn_key, color: Colors.blueGrey),
          hintText: "Password",
          hintStyle: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        controller: passwordcontrol,
      ),
    );
  }

  Widget newAccountButton(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 1.0, 0.0, 0.0),
      child: new FlatButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => newAccount()));
        },
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          "Create an account",
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        color: Colors.black87,
      ),
    );
  }

  Widget loginButton(context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 35.0, 0.0, 0.0),
      child: new RaisedButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          child: Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
          color: Colors.blueAccent,
          onPressed: () {
            _auth.signInWithEmailAndPassword
              (email: emailcontrol.text
                , password: passwordcontrol.text)
                .then((oturumAcildi){
              // then() ile giriş işlemi yapıldıktan sonra sayfa geçişini sağlıyoruz
              debugPrint("Giriş başarılı");

              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => MainPage()
              ));
            })
                .catchError((hata) => debugPrint("Hata: "+ hata.toString()));
            //bildiğimiz try-catch mantığı


          }),
    );
  }
}

