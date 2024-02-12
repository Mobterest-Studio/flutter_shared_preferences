import 'package:flutter/material.dart';

class Headline extends StatelessWidget {
  final String headline;
  const Headline({super.key, required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class Tagline extends StatelessWidget {
  final String tagline;

  const Tagline({super.key, required this.tagline});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
      child: Text(
        tagline,
        style: const TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}

ButtonStyle customButtonStyle() {
  return ElevatedButton.styleFrom(
      fixedSize: const Size(150, 50),
      shape: const StadiumBorder(),
      backgroundColor: Colors.deepOrangeAccent,
      disabledBackgroundColor: Colors.grey);
}

class Exercise extends StatelessWidget {
  final String exercise;

  const Exercise({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              exercise,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ActionChip(
              label: const Text(
                "Begineer",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.deepOrangeAccent,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
