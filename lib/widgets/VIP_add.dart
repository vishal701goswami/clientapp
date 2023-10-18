import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:garduino_dashboard/const.dart';
import 'package:http/http.dart' as http;

class VipAddPage extends StatefulWidget {
  const VipAddPage({super.key});

  @override
  State<VipAddPage> createState() => _VipAddPageState();
}

class _VipAddPageState extends State<VipAddPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _levelcontroller = TextEditingController();
  final TextEditingController _dailytaskcontroller = TextEditingController();
  final TextEditingController _singleprofitcontroller = TextEditingController();
  final TextEditingController _dailyprofitcontroller = TextEditingController();
  final TextEditingController _totalprofitcontroller = TextEditingController();
  final TextEditingController _usdtcontroller = TextEditingController();
  userLogin(
      {required String level,
      required String dailytask,
      required String singleprofit,
      required String dailyprofit,
      required String totalprofit,
      required String usdt}) async {
    final response = await http.post(
      Uri.parse('https://earnusdt.shop/webapp/api/v1/vip-add'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        "level": level,
        "dailytask": dailyprofit,
        "singleprofit": singleprofit,
        "dailyprofit": dailyprofit,
        "totalprofut": totalprofit,
        "usdt": usdt,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Vip add succes")));
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
        title: const Text('VIP Add'),
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
                          controller: _levelcontroller,
                          decoration: InputDecoration(
                            // labelText: '',
                            hintText: 'Level',
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
                        controller: _dailytaskcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Daily Task',
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
                        controller: _singleprofitcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Single Profit',
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
                        controller: _dailyprofitcontroller,
                        decoration: InputDecoration(
                          // labelText: '',
                          hintText: 'Daily Profit',
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
                        
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: _totalprofitcontroller,
                          decoration: InputDecoration(
                            hintText: 'Total Profit',
                            hintStyle: const TextStyle(color: Colors.black),
                            // Suffix icon after the input field
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "This field is required";
                            }
                          },
                          // Additional properties like validator and onSaved can be added here.
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        
                        child: TextFormField(
                          controller: _usdtcontroller,
                          decoration: InputDecoration(
                            hintText: 'USDT',
                            hintStyle: const TextStyle(color: Colors.black),
                            // Suffix icon after the input field
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value == null) {
                              return "This field is required";
                            }
                          },
                          // Additional properties like validator and onSaved can be added here.
                        )),
                  ),
                ),
              ],
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (_formkey.currentState!.validate()) {
                    await userLogin(
                        level: _levelcontroller.text,
                        dailytask: _dailytaskcontroller.text,
                        singleprofit: _singleprofitcontroller.text,
                        dailyprofit: _dailyprofitcontroller.text,
                        totalprofit: _totalprofitcontroller.text,
                        usdt: _usdtcontroller.text);
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
