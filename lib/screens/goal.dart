import 'package:flutter/material.dart';
import 'package:vertical_picker/vertical_picker.dart';
import '../main.dart';
import '../utils/constants.dart';
import '../utils/widgets.dart';

class GoalScreen extends StatefulWidget {
  const GoalScreen({super.key});

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
            top: 30.0, right: 8.0, left: 8.0, bottom: 10.0),
        child: Column(
          children: [
            const Headline(headline: "What's your goal"),
            const Tagline(
              tagline: "This helps us create your personalized plan",
            ),
            const Spacer(),
            SizedBox(
              height: 200,
              child: VerticalPicker(
                  leftMargin: 100,
                  rightMargin: 100,
                  loop: false,
                  items: List.generate(Constant.goals.length,
                      (index) => Center(child: Text(Constant.goals[index]))),
                  onSelectedChanged: (indexSelected) {
                    prefs?.setString(
                        Constant.prefGoal, Constant.goals[indexSelected]);
                    setState(() {});
                  },
                  borderColor: Colors.deepOrangeAccent,
                  borderThickness: 2,
                  itemHeight: MediaQuery.of(context).size.height / 10),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/username");
                    },
                    icon: const Icon(Icons.arrow_left),
                    label: const Text("Skip This")),
                ElevatedButton.icon(
                    onPressed: (prefs?.getString(Constant.prefGoal) == null)
                        ? null
                        : () {
                            Navigator.pushNamed(context, "/username");
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
