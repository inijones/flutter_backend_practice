import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final String yourAnswer;
  final Function answerQuetion;
  const Answers(
      {Key? key, required this.yourAnswer, required this.answerQuetion})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        yourAnswer,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Questions extends StatelessWidget {
  final String handler;
  const Questions({Key? key, required this.handler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      handler,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class QuizColumn extends StatefulWidget {
  const QuizColumn({Key? key}) : super(key: key);

  @override
  State<QuizColumn> createState() => _QuizColumnState();
}

class _QuizColumnState extends State<QuizColumn> {
  final _questions = [
    {
      'questionText': 'What\'s the meaning of Assuetude?',
      'answers': ['kiss', 'insolent', 'habit', 'half'],
    },
    {
      'questionText': 'What\'s the meaning of Disingenuous?',
      'answers': ['guilty', 'jovial', 'jocular', 'insincere'],
    },
    {
      'questionText': 'What\'s the meaning of Afflatus?',
      'answers': ['ghost', 'inspiration', 'lifeless', 'greedy'],
    }
  ];
  final int _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Questions(
              handler: _questions[_questionIndex]["questionText"] as String,
            ),
            ...(_questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answers(yourAnswer: answer, answerQuetion: () {});
            }).toList()
          ],
        ),
      ),
    );
  }
}
