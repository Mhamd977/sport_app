import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'home.dart';
import 'main.dart';

import 'package:sport_app/home.dart';

final List<String> _missions = [];
// domain of your server
const String _baseURL = 'sport-app.000webhostapp.com';

class ShowMissions extends StatefulWidget {
  const ShowMissions({super.key});

  @override
  State<ShowMissions> createState() => _ShowMissionsState();
}

class _ShowMissionsState extends State<ShowMissions> {
  bool _load = false;

  void update(bool success) {
    setState(() {
      _load = true; // show product list
      if (!success) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('failed to load data')));
      }
    });
  }

  @override
  void initState() {
    updateMissions(update);
    super.initState();
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
          title: const Text('Available Missions'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: _load
            ? const ListMissions()
            : const Center(
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator())));
  }
}

class ListMissions extends StatelessWidget {
  const ListMissions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: _missions.length,
      itemBuilder: (context, index) => Column(
        children: [
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            padding: const EdgeInsets.all(5),
            width: width * 0.9,
            child: Row(
              children: [
                SizedBox(width: width * 0.1),
                Flexible(
                  child: Text(
                    _missions[index].toString(),
                    style: TextStyle(fontSize: width * 0.05),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void updateMissions(Function(bool success) update) async {
  try {
    final url = Uri.https(_baseURL, 'getMissions.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));
    _missions.clear();
    if (response.statusCode == 200) {
      final jsonResponse = convert
          .jsonDecode(response.body); // create dart json object from json array
      for (var row in jsonResponse) {
        _missions.add(
            'Time: ${row['mission_date']}\nTitle: ${row['mission_title']}\nMission: ${row['mission_desc']}');
      }
      update(true);
    }
  } catch (e) {
    update(false);
  }
}
