import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_login_operations/main.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePage();
  }
}

class HomePage extends State<MainPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 5, 5, 0),
                    child: FloatingActionButton(
                      child: Icon(Icons.power_settings_new),
                      onPressed: () {
                        _auth.signOut().then((oturumKapatildi) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MyApp()));
                        });
                      },
                      mini: true,
                      backgroundColor: Colors.pink[200],
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.green[200],
                            child: Text("Add Data"),
                            onPressed: () {
                              Map<String, dynamic> veriEkle = Map();
                              veriEkle["isim"] = "Kubra";
                              veriEkle["yas"] = 20;

                              _firestore
                                  .collection("Kullanici")
                                  .document("ogrenci")
                                  .setData(veriEkle);

                              _firestore
                                  .collection("Kullanici")
                                  .document("ogretmen")
                                  .setData(veriEkle);
                            },
                          ),
                          RaisedButton(
                            color: Colors.blue[200],
                            child: Text("Delete Data"),
                            onPressed: () {
                              _firestore
                                  .document("Kullanici/ogrenci")
                                  .delete();

                              _firestore
                                  .document("Kullanici/ogretmen")
                                  .updateData({"isim": FieldValue.delete()});
                            },
                          ),
                          RaisedButton(
                            color: Colors.purple[200],
                            child: Text("Update Data"),
                            onPressed: () {
                              _firestore
                                  .document("Kullanici/ogrenci")
                                  .updateData({"isim": "Derya"});
                            },
                          ),
                          RaisedButton(
                              color: Colors.red[200],
                              child: Text("Read Data"),
                              onPressed: veriOkuma),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future veriOkuma() async {
    DocumentSnapshot documentSnapshot =
        await _firestore.document("Kullanici/ogrenci").get();

    debugPrint("Characteristics of the student: " + documentSnapshot.data.toString());

    debugPrint("Name of the student: " + documentSnapshot.data["isim"].toString());

    debugPrint("The age of the student: " + documentSnapshot.data["yas"].toString());
  }
}
