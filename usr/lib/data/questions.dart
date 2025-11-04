import 'package:couldai_user_app/models/question.dart';

List<Question> getQuestionsForLevel(String level) {
  switch (level) {
    case 'Easy':
      return _easyQuestions;
    case 'Medium':
      return _mediumQuestions;
    case 'Hard':
      return _hardQuestions;
    default:
      return _easyQuestions;
  }
}

final List<Question> _easyQuestions = [
  Question(
    'What is the capital of France?',
    [
      Answer('Berlin', false),
      Answer('Madrid', false),
      Answer('Paris', true),
      Answer('Rome', false),
    ],
  ),
  Question(
    'What is 2 + 2?',
    [
      Answer('3', false),
      Answer('4', true),
      Answer('5', false),
      Answer('6', false),
    ],
  ),
    Question(
      'What is the color of the sky on a clear day?',
      [
        Answer('Green', false),
        Answer('Blue', true),
        Answer('Red', false),
        Answer('Yellow', false),
      ],
    ),
];

final List<Question> _mediumQuestions = [
  Question(
    'What is the largest planet in our solar system?',
    [
      Answer('Earth', false),
      Answer('Jupiter', true),
      Answer('Mars', false),
      Answer('Saturn', false),
    ],
  ),
  Question(
    'What is the chemical symbol for water?',
    [
      Answer('O2', false),
      Answer('CO2', false),
      Answer('H2O', true),
      Answer('NaCl', false),
    ],
  ),
  Question(
    'Who wrote "Hamlet"?',
    [
      Answer('Charles Dickens', false),
      Answer('William Shakespeare', true),
      Answer('Leo Tolstoy', false),
      Answer('Mark Twain', false),
    ],
  ),
];

final List<Question> _hardQuestions = [
  Question(
    'What is the powerhouse of the cell?',
    [
      Answer('Nucleus', false),
      Answer('Ribosome', false),
      Answer('Mitochondria', true),
      Answer('Golgi apparatus', false),
    ],
  ),
  Question(
    'In what year did the Titanic sink?',
    [
      Answer('1905', false),
      Answer('1912', true),
      Answer('1918', false),
      Answer('1923', false),
    ],
  ),
    Question(
      'Who discovered penicillin?',
      [
        Answer('Marie Curie', false),
        Answer('Alexander Fleming', true),
        Answer('Isaac Newton', false),
        Answer('Albert Einstein', false),
      ],
    ),
];