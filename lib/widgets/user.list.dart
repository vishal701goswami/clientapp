import 'dart:developer';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
   late Future<UserList> futureAlbum;
  Future<UserList> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://earnusdt.shop/webapp/api/v1/user-list'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      log(response.body.toString());
      return UserList.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
      ),
      body: FutureBuilder<UserList>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top:8.0, left: 12, right: 12),
                      child: Card(
                        color: const Color.fromARGB(255, 207, 144, 232),
                        child: ListTile(
                          
                          leading: Text("${index+1}"),
                          title: Text(snapshot.data!.data[index].email),
                          trailing: Text(snapshot.data!.data[index].currentvalance.toString()),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

// To parse this JSON data, do
//
//     final userList = userListFromJson(jsonString);

UserList userListFromJson(String str) => UserList.fromJson(json.decode(str));

String userListToJson(UserList data) => json.encode(data.toJson());

class UserList {
  List<Datum> data;

  UserList({
    required this.data,
  });

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String email;
  String password;
  String secpassword;
  int currentvalance;
  String invaitecode;

  Datum({
    required this.id,
    required this.email,
    required this.password,
    required this.secpassword,
    required this.currentvalance,
    required this.invaitecode,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        secpassword: json["secpassword"],
        currentvalance: json["currentvalance"],
        invaitecode: json["invaitecode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "secpassword": secpassword,
        "currentvalance": currentvalance,
        "invaitecode": invaitecode,
      };
}
