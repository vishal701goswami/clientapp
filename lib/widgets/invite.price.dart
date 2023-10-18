import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garduino_dashboard/const.dart';
import 'package:http/http.dart' as http;

class InvitePage extends StatefulWidget {
  const InvitePage({super.key});

  @override
  State<InvitePage> createState() => _InvitePageState();
}

class _InvitePageState extends State<InvitePage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _levelcontroller = TextEditingController();
  final TextEditingController _dailytaskcontroller = TextEditingController();
  final TextEditingController _singleprofitcontroller = TextEditingController();
  final TextEditingController _dailyprofitcontroller = TextEditingController();
  final TextEditingController _totalprofitcontroller = TextEditingController();
  final TextEditingController _usdtcontroller = TextEditingController();

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
                        hintText: 'First Invite',
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _dailytaskcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Second Invite',
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
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This field is required";
                          }
                        },
                        // Additional properties like validator and onSaved can be added here.
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
                        controller: _singleprofitcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Forth Invite',
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
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This field is required";
                          }
                        },
                        // Additional properties like validator and onSaved can be added here.
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        controller: _dailyprofitcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Last Invite',
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
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "This field is required";
                          }
                        },
                        // Additional properties like validator and onSaved can be added here.
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
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
