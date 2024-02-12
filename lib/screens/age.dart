import 'package:fitflow/main.dart';
import 'package:fitflow/utils/widgets.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  final TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ageController.text = prefs?.getInt(Constant.prefAge).toString() ?? "30";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
            top: 30.0, right: 8.0, left: 8.0, bottom: 10.0),
        child: Column(
          children: [
            const Headline(headline: "How old are you?"),
            const Tagline(
              tagline: "This helps us create your personalized plan",
            ),
            const Spacer(),
            SizedBox(
                width: 100,
                child: TextField(
                  controller: ageController,
                  style: const TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.deepOrangeAccent,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      suffix: Text(
                    "years",
                    style: TextStyle(fontSize: 16),
                  )),
                )),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/weight");
                    },
                    icon: const Icon(Icons.arrow_left),
                    label: const Text("Skip This")),
                ElevatedButton.icon(
                    onPressed: (ageController.text.isEmpty)
                        ? null
                        : () {
                            prefs?.setInt(Constant.prefAge,
                                int.parse(ageController.text));
                            Navigator.pushNamed(context, "/weight");
                          },
                    style: customButtonStyle(),
                    icon: const Icon(Icons.keyboard_arrow_right),
                    label: const Text("Next"))
              ],
            )
          ],
        ),
      )),
    );
  }
}
