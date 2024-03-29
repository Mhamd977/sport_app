import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'clientPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> loginUser() async {
    final response = await http.post(
      Uri.parse('https://sport-app.000webhostapp.com/login.php'),
      body: {
        'action': 'login',
        'username': usernameController.text,
        'password': passwordController.text,
      },
    );

    print('Response status code: ${response.statusCode}');
    if (response.statusCode == 200) {
      print(response.body);
      if (response.body.contains('Successfully logged in')) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShowMissions()),
        );
      } else {
        // String failedMsg(){
        //   return "Failed to login";
        // }
        print('Login failed');
      }
    } else {
      print('Failed to login: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 40),
              ),
              onPressed: () {
                loginUser();
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
