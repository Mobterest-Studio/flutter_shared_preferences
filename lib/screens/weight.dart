import 'package:fitflow/utils/widgets.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/constants.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    weightController.text = (prefs?.getDouble(Constant.prefWeight) == null)
        ? "65"
        : prefs?.getDouble(Constant.prefWeight).toString() ?? "65";
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
            const Headline(headline: "What's your weight"),
            const Tagline(
              tagline: "You can always change this later",
            ),
            const Spacer(),
            SizedBox(
                width: 100,
                child: TextField(
                  controller: weightController,
                  style: const TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.deepOrangeAccent,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      suffix: Text(
                    "kgs",
                    style: TextStyle(fontSize: 16),
                  )),
                )),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/goal");
                    },
                    icon: const Icon(Icons.arrow_left),
                    label: const Text("Skip This")),
                ElevatedButton.icon(
                    onPressed: (weightController.text.isEmpty)
                        ? null
                        : () {
                            prefs?.setDouble(Constant.prefWeight,
                                double.parse(weightController.text));
                            Navigator.pushNamed(context, "/goal");
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
