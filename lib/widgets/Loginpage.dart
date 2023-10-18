import 'package:flutter/material.dart';
import 'package:garduino_dashboard/const.dart';
import 'package:garduino_dashboard/dashboard.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Center(
                  child: Icon(
                    Icons.lock,
                    color: Colors.blue,
                    size: 80,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: _emailcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  controller: _passcontroller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock, color: Colors.blue),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    if (_emailcontroller.text == "admin@admin.com" &&
                        _passcontroller.text == "admin@1234") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Invalid Email passwords")));
                    }
                  }
                },
                child: Container(
                  height: 55,
                  width: 160,
                  decoration: BoxDecoration(
                      color: cardBackgroundColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Text("LOGIN",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
