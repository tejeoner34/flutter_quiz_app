import 'package:flutter/material.dart';
import 'package:flutter_advanced_basics/models/summary_data.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});
  final SummaryData summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.questionsData
              .map(
                (data) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            data['isCorrect'] ? Colors.green : Colors.red,
                        child: Text(
                          data['questionNumber'],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              data['question'],
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              data['userAnswer'],
                              style: TextStyle(
                                  color: data['isCorrect']
                                      ? Colors.green
                                      : Colors.red),
                            ),
                            Text(data['correctAnswer'],
                                style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
