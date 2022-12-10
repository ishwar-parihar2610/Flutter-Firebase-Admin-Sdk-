import 'package:firebase_admin/firebase_admin.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id = "";
  var app = FirebaseAdmin.instance.app();
  String userName = "";
  String userEmail = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Text("$userName"),
          ),
          Text("$userEmail"),
          InkWell(
            onTap: () {
              setState(() {
                getUser();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 45,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Read User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              addUser();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 45,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Create User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              updateUser();
            },
            child: Container(
              margin: EdgeInsets.only(top: 10),
              height: 45,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Update User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              deleteUser();
            },
            child: Container(
              height: 45,
              width: 100,
              margin: EdgeInsets.only(top: 10),
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Delete User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future addUser() async {
    await app
        ?.auth()
        .createUser(
          displayName: "ishwar",
          email: "pariharishwer26102000@gmail.com",
          password: "1234567890",
        )
        .then((value) {
      id = value.uid;
    });
  }

  Future updateUser() async {
    await app?.auth().updateUser(id, displayName: "manish sharma");
  }

  Future deleteUser() async {
    await app?.auth().deleteUser(id);
  }

  Future getUser() async {
    await app?.auth().getUser(id).then((value) {
      userName = value.displayName ?? "";
      userEmail = value.email ?? "";
    });
  }
}
