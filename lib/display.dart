import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'notifier.dart';
import 'login.dart';

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    final value = context.read<Notifier>().username;

    return Scaffold(
      appBar: AppBar(title: Text('The Display Screen')),

      body: Center(child: Column(children: [Text(value)])),
    );
  }
}
