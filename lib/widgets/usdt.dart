import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garduino_dashboard/const.dart';
import 'package:http/http.dart' as http;

class Usdt extends StatefulWidget {
  const Usdt({super.key});

  @override
  State<Usdt> createState() => _UsdtState();
}

class _UsdtState extends State<Usdt> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _levelcontroller = TextEditingController();
  userLogin({
    required String level,
  }) async {
    final response = await http.post(
      Uri.parse('https://earnusdt.shop/webapp/api/v1/usdt'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "value": level,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Usdt id add succes")));
      log(response.body);
      Map data = jsonDecode(response.body);

      // ignore: use_build_context_synchronously
      // Future.delayed(const Duration(seconds: 1), () {
      //   Navigator.push(
      //       context, CupertinoPageRoute(builder: (context) => const MyApp()));
      // });
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Vip add faild")));
      log(jsonDecode(response.body));
      throw Exception('Failed to create album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Price'),
        backgroundColor: const Color(0xFF21222D),
      ),
      body: Form(
        key: _formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                        controller: _levelcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Fill Your usdt wallet id',
                          hintStyle: const TextStyle(color: Colors.black),
                          // Suffix icon after the input field
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200],
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        // A
                        //dditional properties like validator and onSaved can be added here.
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This field is required";
                          }
                        },
                      )),
                    ),
                  ),
                ]),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
                    await userLogin(level: _levelcontroller.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Invite Price updated")));
                  }
                },
                child: Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: cardBackgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("SUBMIT",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
