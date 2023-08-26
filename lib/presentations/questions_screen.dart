import 'package:flutter/material.dart';
import 'package:flutter_advanced_basics/presentations/answer_button.dart';
import 'package:flutter_advanced_basics/data/questions_data.dart';

import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onChooseAnswer});

  final void Function(String answer, bool isLastQuestion) onChooseAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void handleChooseAnswer(String answer) {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex += 1;
        widget.onChooseAnswer(
            answer, currentQuestionIndex == questions.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currenQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currenQuestion.question,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currenQuestion.shuffleAnswers().map(
                  (answer) => AnswerButton(
                    onPressed: () {
                      handleChooseAnswer(answer);
                    },
                    text: Text(answer),
                  ),
                )
          ],
        ),
      ),
    );
  }
}
