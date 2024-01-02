import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'admin_login.dart';

class Creator extends StatelessWidget {
  const Creator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mohammad Nasser'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Body(context), // Pass context to the Body method
    );
  }

  Widget Body(BuildContext context) { // Accept context as a parameter
    return Container(
      child: Column(
        children: [
          const SizedBox(height: 1.0),
          const Text(
            "Mohammad Nasser",
            style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
          ),
          const Text(
            "id: 12030553",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          const Image(image: AssetImage('assets/me.jpg')),
          const SizedBox(height: 10.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 40),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminLoginPage()),
              );
            },
            child: const Text('Admin Login', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
