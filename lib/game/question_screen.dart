import 'package:flutter/material.dart';
import 'game_notifier.dart';
import 'package:provider/provider.dart';
import 'package:prexams/notifier.dart';
import 'dummy_file.dart';
import 'package:prexams/countdown_widget.dart';
import 'package:prexams/quiz_timer_notifier.dart';

class QuestionScreen extends StatelessWidget {
  final int number;
  const QuestionScreen({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final quizzesProvider = Provider.of<GameNotifier>(context);
    final name = context.watch<Notifier>().username;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Random Quiz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountdownWidget(),

              Text('Quiz ${quizzesProvider.currentQuestion.number}/8'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Text(
                    quizzesProvider.currentQuestion.questionText,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 60),

                  ...quizzesProvider.currentQuestion.optionValue
                      .asMap()
                      .entries
                      .map((entry) {
                        int idx = entry.key;
                        String option = entry.value;

                        return InkWell(
                          splashColor: Colors.white,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            quizzesProvider.answerQuestion(context, idx);
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 16,
                            ),
                            padding: EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              option,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          // child: Text(option),
                        );
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
