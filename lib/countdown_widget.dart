import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz_timer_notifier.dart';

class CountdownWidget extends StatefulWidget {
  const CountdownWidget({super.key});

  @override
  State<CountdownWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  @override
  void initState() {
    super.initState();
    // Start the timer after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<QuizTimerNotifier>().startTimer(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final timer = context.watch<QuizTimerNotifier>();
    // QuizTimerNotifier();

    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform.scale(
            scale: 2.3,
            child: CircularProgressIndicator(
              value: timer.timeLeft / timer.totalSeconds,
              strokeWidth: 5,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(
                Color.fromARGB(255, 16, 62, 140),
              ),
            ),
          ),
          Text(
            "${timer.timeLeft}s",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
