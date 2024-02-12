import 'package:fitflow/main.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fitflow"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/settings");
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            RichText(
                text: TextSpan(
                    text: 'Hello ',
                    style: const TextStyle(
                        fontSize: 24, color: Colors.deepOrangeAccent),
                    children: <TextSpan>[
                  TextSpan(
                      text: prefs?.getString(Constant.prefUsername) ?? "",
                      style: const TextStyle(fontWeight: FontWeight.bold))
                ])),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constant.exercises.length,
              itemBuilder: (context, index) {
                return Exercise(exercise: Constant.exercises[index]);
              },
            )
          ],
        ),
      )),
    );
  }
}
