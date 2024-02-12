import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/constants.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Image(
              image: AssetImage("assets/fitness1.jpg"),
              fit: BoxFit.fitHeight,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    stops: [0.3, 1.0],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.black, Colors.black26])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Create a workout plan",
                  style:
                      TextStyle(fontSize: 28, color: Colors.deepOrangeAccent),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    "to fit",
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      if (prefs?.getString(Constant.prefGender) != null) {
                        if (prefs?.getInt(Constant.prefAge) != null) {
                          if (prefs?.getDouble(Constant.prefWeight) != null) {
                            if (prefs?.getString(Constant.prefGoal) != null) {
                              if (prefs?.getString(Constant.prefUsername) !=
                                  null) {
                                Navigator.pushNamed(context, "/home");
                              } else {
                                //add more ifs here
                                Navigator.pushNamed(context, "/username");
                              }
                            } else {
                              //add more ifs here
                              Navigator.pushNamed(context, "/goal");
                            }
                          } else {
                            Navigator.pushNamed(context, "/weight");
                          }
                        } else {
                          Navigator.pushNamed(context, "/age");
                        }
                      } else {
                        Navigator.pushNamed(context, "/about");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 50),
                        shape: const StadiumBorder(),
                        backgroundColor: Colors.deepOrangeAccent),
                    icon: const Icon(Icons.keyboard_arrow_right),
                    label: const Text("Start Now",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
