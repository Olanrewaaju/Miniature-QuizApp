import 'package:flutter/material.dart';
import 'package:prexams/game/question_screen.dart';
import 'package:prexams/login.dart';
import 'package:prexams/notifier.dart';
import 'package:provider/provider.dart';
import 'quiz_timer_notifier.dart';
import 'game/game_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => QuizTimerNotifier(totalSeconds: 25),
        ),
        ChangeNotifierProvider(create: (context) => Notifier()),
        ChangeNotifierProvider(create: (context) => GameNotifier()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 16, 62, 140),
          ),
        ),
      ),
      home: Login(),
    );
  }
}
