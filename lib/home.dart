import 'dart:ui';
import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'mohammad.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(homePage());
}

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport App'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Creator()),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.info,
                size: 30,
                color: Colors.black,
              ),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text("🏋️‍♂️ Catch Mohammad's Daily Challenges: ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              SizedBox(height: 20,),
              const Text(
                  "Receive personalized daily sports missions crafted by Mohammad himself. For good and health body.",
                  style: TextStyle(fontSize: 20)),
              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 40),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child:
                    const Text('Register Now', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                      200, 40), // Adjust the width and height as needed
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text('Login', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
