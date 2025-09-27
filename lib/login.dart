import 'package:flutter/material.dart';
import 'package:prexams/display.dart';
import 'package:prexams/notifier.dart';
import 'package:provider/provider.dart';
import 'game/game_notifier.dart';
import 'game/question_screen.dart';
import 'homescreen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController user = TextEditingController();
  void changes() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => Homescreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: user,
                decoration: InputDecoration(
                  hintText: 'Enter Your Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                ),
                onChanged: (value) {
                  context.read<Notifier>().person(user.text);
                },
              ),
              SizedBox(height: 50),
              SizedBox(
                width: double.infinity,
                height: 54,

                child: ElevatedButton(
                  onPressed: changes,

                  child: Text(
                    'Hit the Button',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
