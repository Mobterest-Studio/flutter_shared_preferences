import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/constants.dart';
import '../utils/widgets.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameController.text = (prefs?.getString(Constant.prefUsername) == null)
        ? ""
        : prefs?.getString(Constant.prefUsername) ?? "";
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
            const Headline(headline: "What's your username"),
            const Tagline(
              tagline: "Set the username you'll be identified with",
            ),
            const Spacer(),
            SizedBox(
                width: 200,
                child: TextField(
                  controller: usernameController,
                  style: const TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  cursorColor: Colors.deepOrangeAccent,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      hintText: "Set username",
                      hintStyle: TextStyle(
                        fontSize: 18,
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.deepOrange))),
                )),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    icon: const Icon(Icons.arrow_left),
                    label: const Text("Skip This")),
                ElevatedButton.icon(
                    onPressed: (usernameController.text.isEmpty)
                        ? null
                        : () {
                            prefs?.setString(
                                Constant.prefUsername, usernameController.text);
                            Navigator.pushNamed(context, "/home");
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
