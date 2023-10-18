import 'package:flutter/material.dart';
import 'package:garduino_dashboard/const.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 40,
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
                          // Additional properties like validator and onSaved can be added here.
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
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
                      height: 40,
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
                        // Additional properties like validator and onSaved can be added here.
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
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
                        height: 40,
                        // decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     borderRadius: BorderRadius.circular(30)),
                        child: TextFormField(
                          controller: _totalprofitcontroller,
                          decoration: InputDecoration(
                            labelText: '',
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
                          // Additional properties like validator and onSaved can be added here.
                        )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        height: 40,
                        child: TextFormField(
                          controller: _usdtcontroller,
                          decoration: InputDecoration(
                            labelText: '',
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
                          // Additional properties like validator and onSaved can be added here.
                        )),
                  ),
                ),
              ],
            ),
            Container(
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
          ],
        ),
      ),
    );
  }
}
