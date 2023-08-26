import 'package:flutter/material.dart';

class QuizHomeScreen extends StatelessWidget {
  const QuizHomeScreen(this.displayQuestionsScreen, {super.key});

  final Function() displayQuestionsScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 350,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Learn flutter the right way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: displayQuestionsScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_forward_sharp),
          ),
        ],
      ),
    );
  }
}
