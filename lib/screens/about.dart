import 'package:fitflow/utils/constants.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/widgets.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
            top: 30.0, right: 8.0, left: 8.0, bottom: 10.0),
        child: Column(
          children: [
            const Headline(headline: "Tell us about yourself"),
            const Tagline(
              tagline:
                  "To give you a better experience, we need to know your gender",
            ),
            const Spacer(),
            SizedBox(
              width: 150,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: Gender.values.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: GestureDetector(
                      onTap: () {
                        prefs?.setString(
                            Constant.prefGender, Gender.values[index].name);
                        setState(() {});
                      },
                      child: ClipOval(
                        child: Container(
                          color: (Gender.values[index].name ==
                                  prefs?.getString(Constant.prefGender)
                              ? Colors.deepOrangeAccent
                              : Colors.grey),
                          width: 150,
                          height: 150,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  (Gender.values[index].name ==
                                          Gender.male.name)
                                      ? Icons.male
                                      : Icons.female,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                Text(
                                  Gender.values[index].name,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 16),
                                )
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/age");
                    },
                    icon: const Icon(Icons.arrow_left),
                    label: const Text("Skip This")),
                ElevatedButton.icon(
                    onPressed: (prefs?.getString(Constant.prefGender) != null)
                        ? () {
                            Navigator.pushNamed(context, "/age");
                          }
                        : null,
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
