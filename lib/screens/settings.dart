import 'package:fitflow/app_builder.dart';
import 'package:fitflow/main.dart';
import 'package:fitflow/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
              onPressed: () {
                prefs?.clear();
              },
              icon: const Icon(
                Icons.delete_forever,
                size: 30,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(2.0),
              margin: const EdgeInsets.only(top: 10, bottom: 15),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black12),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.black45,
                ),
              ),
            ),
            (prefs?.getString(Constant.prefUsername) == null)
                ? ActionChip(
                    label: const Text("Set username"),
                    onPressed: () {
                      setUsername(context);
                    },
                  )
                : Text(
                    prefs?.getString(Constant.prefUsername) ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 22),
                  ),
            Text.rich(TextSpan(children: <InlineSpan>[
              WidgetSpan(
                  child: (prefs?.getString(Constant.prefUsername) == null)
                      ? const SizedBox.shrink()
                      : TextButton.icon(
                          onPressed: () {
                            prefs?.remove(Constant.prefUsername);
                            setState(() {});
                          },
                          label: const Text(
                            "Remove username",
                            style: TextStyle(color: Colors.deepOrangeAccent),
                          ),
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            size: 25,
                            color: Colors.deepOrangeAccent,
                          ))),
            ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 80,
                  child: InkWell(
                    onTap: () {
                      updateAge(context);
                    },
                    child: Card(
                      child: Column(children: [
                        const Text(
                          "Age",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text:
                                    prefs?.getInt(Constant.prefAge).toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.deepOrangeAccent),
                                children: const <TextSpan>[
                              TextSpan(
                                  text: "\t years",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey))
                            ]))
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 80,
                  child: InkWell(
                    onTap: () {
                      updateWeight(context);
                    },
                    child: Card(
                      child: Column(children: [
                        const Text(
                          "Weight",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                text: prefs
                                    ?.getDouble(Constant.prefWeight)
                                    .toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                    color: Colors.deepOrangeAccent),
                                children: const <TextSpan>[
                              TextSpan(
                                  text: "\t kgs",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey))
                            ]))
                      ]),
                    ),
                  ),
                )
              ],
            ),
            ListTile(
              title: const Text("Dark mode"),
              trailing: Switch(
                activeColor: Colors.deepOrangeAccent,
                value: prefs?.getBool(Constant.prefDarkTheme) ?? false,
                onChanged: (value) {
                  prefs?.setBool(Constant.prefDarkTheme, value);
                  setState(() {});
                  AppBuilder.of(context)?.rebuild();
                },
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            Visibility(
              visible: prefs?.getBool(Constant.prefNotifications) ?? false,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ActionChip(
                              backgroundColor: Colors.deepOrange,
                              onPressed: () {},
                              label: const Text(
                                "PRO",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                          const Text(
                            "\tUpgrade to Premium",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Goal",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.orangeAccent),
              ),
              subtitle: Text(prefs?.getString(Constant.prefGoal) ?? ""),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Workouts",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropDownMultiSelect(
                options: Constant.workouts,
                selectedValues:
                    prefs?.getStringList(Constant.prefWorkouts) ?? <String>[],
                onChanged: (List<String> wkts) {
                  prefs?.setStringList(Constant.prefWorkouts, wkts);
                  setState(() {});
                },
                whenEmpty: "Select something",
              ),
            ),
            ListTile(
              title: const Text("Notifications"),
              trailing: Switch(
                activeColor: Colors.deepOrangeAccent,
                value: prefs?.getBool(Constant.prefNotifications) ?? false,
                onChanged: (value) {
                  prefs?.setBool(Constant.prefNotifications, value);
                  setState(() {});
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future<dynamic> setUsername(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Set username",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          content: TextField(
            controller: usernameController,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  prefs?.setString(
                      Constant.prefUsername, usernameController.text);
                  usernameController.clear();
                  Navigator.pop(context);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.deepOrangeAccent),
                child: const Text("Save"))
          ],
        );
      },
    );
  }

  Future<dynamic> updateAge(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        valueController.text = prefs?.getInt(Constant.prefAge).toString() ?? "";
        return AlertDialog(
          title: const Text(
            "Update\t Age",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          content: TextField(
            controller: valueController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  prefs?.setInt(
                      Constant.prefAge, int.parse(valueController.text));
                  valueController.clear();
                  Navigator.pop(context);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.deepOrangeAccent),
                child: const Text("Save")),
            OutlinedButton(
                onPressed: () {
                  valueController.clear();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text("Cancel"))
          ],
        );
      },
    );
  }

  Future<dynamic> updateWeight(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        valueController.text =
            prefs?.getDouble(Constant.prefWeight).toString() ?? "";
        return AlertDialog(
          title: const Text(
            "Update\t Weight",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          content: TextField(
            controller: valueController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  prefs?.setDouble(
                      Constant.prefWeight, double.parse(valueController.text));
                  valueController.clear();
                  Navigator.pop(context);
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.deepOrangeAccent),
                child: const Text("Save")),
            OutlinedButton(
                onPressed: () {
                  valueController.clear();
                  Navigator.pop(context);
                  setState(() {});
                },
                child: const Text("Cancel"))
          ],
        );
      },
    );
  }
}
