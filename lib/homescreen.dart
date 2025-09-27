import 'package:flutter/material.dart';
import 'package:prexams/notifier.dart';
import 'package:provider/provider.dart';
import 'game/question_screen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  void screenchanger() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return QuestionScreen(number: 0);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final name = context.watch<Notifier>().username;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                'Hello $name',
                style: TextStyle(fontSize: 45, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 14),
              Text(
                'Are you Ready for the Quiz ??',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),

              Spacer(),
              SizedBox(
                height: 54,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    maximumSize: WidgetStatePropertyAll(
                      Size(double.infinity, 64),
                    ),
                  ),
                  onPressed: screenchanger,
                  child: Text(
                    'Click Here to start',
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
