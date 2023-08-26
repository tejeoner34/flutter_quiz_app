import 'package:flutter/material.dart';
import 'package:flutter_advanced_basics/models/summary_data.dart';
import 'package:flutter_advanced_basics/presentations/questions_screen.dart';
import 'package:flutter_advanced_basics/presentations/quiz_home_screen.dart';
import 'package:flutter_advanced_basics/presentations/responses_screen.dart';

import 'package:flutter_advanced_basics/data/questions_data.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late Widget activeScreen = QuizHomeScreen(displayQuestionsScreen);
  List<String> answers = [];

  void addNewAnswer(String answer, bool isLastQuestion) {
    answers.add(answer);
    if (isLastQuestion) {
      setState(() {
        activeScreen = ResponsesScreen(
            summaryData: getSummaryData(), onRestartApp: resetApp);
      });
    }
  }

  displayQuestionsScreen() {
    setState(() {
      activeScreen = QuestionsScreen(
        onChooseAnswer: addNewAnswer,
      );
    });
  }

  void resetApp() {
    setState(() {
      answers = [];
      activeScreen = QuizHomeScreen(displayQuestionsScreen);
    });
  }

  SummaryData getSummaryData() {
    SummaryData data = SummaryData([], 0, 0);
    for (var i = 0; i < answers.length; i++) {
      data.questionsData.add({
        'questionNumber': (i + 1).toString(),
        'question': questions[i].question,
        'userAnswer': answers[i],
        'correctAnswer': questions[i].answers[0],
        'isCorrect': answers[i] == questions[i].answers[0],
      });
      if (data.questionsData[i]['userAnswer'] ==
          data.questionsData[i]['correctAnswer']) {
        data.numberOfCorrectQuestions++;
      }
    }
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 82, 29, 126),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
