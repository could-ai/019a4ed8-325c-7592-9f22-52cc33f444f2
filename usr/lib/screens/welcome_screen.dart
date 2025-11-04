import 'package:flutter/material.dart';
import 'package:couldai_user_app/screens/game_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _startGame(BuildContext context, String level) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GameScreen(level: level)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Trivia Puzzle Game',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select a Level',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 40),
            LevelButton(
              level: 'Easy',
              onPressed: () => _startGame(context, 'Easy'),
            ),
            const SizedBox(height: 20),
            LevelButton(
              level: 'Medium',
              onPressed: () => _startGame(context, 'Medium'),
            ),
            const SizedBox(height: 20),
            LevelButton(
              level: 'Hard',
              onPressed: () => _startGame(context, 'Hard'),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelButton extends StatelessWidget {
  const LevelButton({
    super.key,
    required this.level,
    required this.onPressed,
  });

  final String level;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        textStyle: const TextStyle(fontSize: 20),
        minimumSize: const Size(200, 50),
      ),
      child: Text(level),
    );
  }
}
