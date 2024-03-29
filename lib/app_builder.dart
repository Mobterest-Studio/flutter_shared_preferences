import 'package:flutter/material.dart';

class AppBuilder extends StatefulWidget {
  final Function(BuildContext) builder;

  const AppBuilder({super.key, required this.builder});

  @override
  State<AppBuilder> createState() => AppBuilderState();

  static AppBuilderState? of(BuildContext context) {
    return context.findAncestorStateOfType<AppBuilderState>();
  }
}

class AppBuilderState extends State<AppBuilder> {
  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }

  void rebuild() {
    setState(() {});
  }
}
