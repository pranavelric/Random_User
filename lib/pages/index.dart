import 'dart:convert';
import 'package:fetchdataapi/data/user.dart';
import 'package:fetchdataapi/di/depedency_injection.dart';
import 'package:fetchdataapi/modules/user_presentor.dart';
import 'package:flutter/material.dart';

import '../themes/color.dart';
import 'package:http/http.dart' as http;

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> implements UserListViewContract {
  UserListPresenter _presenter;
  List<User> users = [];
  bool isLoading = false;

  _IndexPageState() {
    _presenter = UserListPresenter(this);
  }

  @override
  void initState() {
    super.initState();

    isLoading = true;
    _presenter.loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listing Users"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (isLoading || (users.length < 0 || users.contains(null))) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      ));
    }
    return Center(
        child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              return getCard(users[index]);
            }));
  }

  Widget getCard(User user) {
    var fullName = user.title + "." + user.first + " " + user.last;
    var imageOfPerson = user.image;
    var email = user.email;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(60 / 2),
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(imageOfPerson))),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fullName),
                  SizedBox(
                    height: 10,
                  ),
                  Text(email,
                      style: TextStyle(fontSize: 10.0, color: Colors.grey))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onLoadUserComplete(List<User> items) {
    setState(() {
      isLoading = false;
      users = items;
    });
  }

  @override
  void onLoadUserError() {
    isLoading = false;
  }
}
