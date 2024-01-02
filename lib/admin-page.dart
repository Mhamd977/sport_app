import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'main.dart';

const String _baseURL = 'https://sport-app.000webhostapp.com';

class AddMission extends StatefulWidget {
  const AddMission({super.key});

  @override
  State<AddMission> createState() => _AddMissionState();
}

class _AddMissionState extends State<AddMission> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controllerMissionTitle = TextEditingController();
  TextEditingController _controllerMissionMission = TextEditingController();
  bool _loading = false;


  @override
  void dispose() {
    _controllerMissionTitle.dispose();
    _controllerMissionMission.dispose();
    super.dispose();
  }

  void update(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
          ],
          title: const Text('Add Mission'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 50),
              SizedBox(width: 200, child: TextFormField(controller: _controllerMissionTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Mission Title',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Mission Title';
                  }
                  return null;
                },
              )),
              const SizedBox(height: 10),
              SizedBox(width: 200, child: TextFormField(controller: _controllerMissionMission,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'The Mission',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the Mission';
                  }
                  return null;
                },
              )),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _loading ? null : () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _loading = true;
                    });
                    saveMission(update, _controllerMissionTitle.text, _controllerMissionMission.text);
                  }
                },
                child: const Text('Submit'),
              ),
              const SizedBox(height: 10),
              const SizedBox(height: 10),
              Visibility(visible: _loading, child: const CircularProgressIndicator())
            ],
          ),
        )));
  }
}

void saveMission(Function(String text) update, String title, String mission) async {
  try {
    final response = await http.post(
        Uri.parse('$_baseURL/saveMission.php'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: convert.jsonEncode(<String, String>{
          'title': title,
          'mission': mission,
          'key': 'your_key',
        })).timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      update(response.body);
    }
  } catch (e) {
    update(e.toString());
  }
}
