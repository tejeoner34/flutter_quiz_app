import 'package:flutter/material.dart';
import 'package:flutter_advanced_basics/models/summary_data.dart';
import 'package:flutter_advanced_basics/presentations/questions_summary.dart';

class ResponsesScreen extends StatelessWidget {
  const ResponsesScreen(
      {super.key, required this.summaryData, required this.onRestartApp});

  final SummaryData summaryData;
  final void Function() onRestartApp;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'You answered ${summaryData.numberOfCorrectQuestions} of X questions correctly',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            QuestionsSummary(
              summaryData: summaryData,
            ),
            TextButton.icon(
              onPressed: () {
                onRestartApp();
              },
              icon: const Icon(
                Icons.update,
              ),
              label: const Text(
                'Restart',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(0, 136, 54, 244),
                iconColor: Colors.white,
                enableFeedback: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
