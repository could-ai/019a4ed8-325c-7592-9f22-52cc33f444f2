import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/question.dart';
import 'package:couldai_user_app/screens/game_over_screen.dart';
import 'package:couldai_user_app/data/questions.dart';

class GameScreen extends StatefulWidget {
  final String level;
  const GameScreen({super.key, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _questionIndex = 0;
  int _score = 0;
  late List<Question> _questions;

  @override
  void initState() {
    super.initState();
    _questions = getQuestionsForLevel(widget.level);
  }

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }

    if (_questionIndex < _questions.length - 1) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GameOverScreen(score: _score, totalQuestions: _questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text('Trivia Puzzle - ${widget.level}'),
        backgroundColor: Colors.deepPurple.shade700,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_questionIndex + 1}/${_questions.length}',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                _questions[_questionIndex].questionText,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, color: Colors.deepPurple),
              ),
            ),
            const SizedBox(height: 20),
            ...(_questions[_questionIndex].answersList).map((answer) {
              return AnswerButton(
                answerText: answer.answerText,
                onPressed: () => _answerQuestion(answer.isCorrect),
              );
            }).toList(),
            const Spacer(),
            Text(
              'Score: $_score',
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onPressed,
  });

  final String answerText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(answerText, style: const TextStyle(fontSize: 18)),
      ),
    );
  }
}
