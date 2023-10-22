class Quiz {
 final String? id;
  final String question;
  final List<Answer> answerList;

  Quiz({required this.question, required this.answerList,this.id});
}

class Answer {
  final String answer;
  final bool isCorrect;

  Answer({required this.answer, required this.isCorrect});
}

List<Quiz> allQuiz = [
  Quiz(
    question: 'What is the national animal of Bangladesh?',
    answerList: [
      Answer(answer: 'Elephant', isCorrect: false), //index 0
      Answer(answer: 'RB Tiger', isCorrect: true), //index 1
      Answer(answer: 'Goat', isCorrect: false), //index 2
      Answer(answer: 'Dog', isCorrect: false), //index 3
    ],
  ),
  Quiz(
    question: 'What is the capital of France?',
    answerList: [
      Answer(answer: 'Berlin', isCorrect: false),
      Answer(answer: 'London', isCorrect: false),
      Answer(answer: 'Paris', isCorrect: true),
      Answer(answer: 'Madrid', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the largest planet in our solar system?',
    answerList: [
      Answer(answer: 'Venus', isCorrect: false),
      Answer(answer: 'Jupiter', isCorrect: true),
      Answer(answer: 'Mars', isCorrect: false),
      Answer(answer: 'Saturn', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which element has the chemical symbol "H"?',
    answerList: [
      Answer(answer: 'Helium', isCorrect: false),
      Answer(answer: 'Hydrogen', isCorrect: true),
      Answer(answer: 'Oxygen', isCorrect: false),
      Answer(answer: 'Nitrogen', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the largest mammal on Earth?',
    answerList: [
      Answer(answer: 'Elephant', isCorrect: false),
      Answer(answer: 'Blue Whale', isCorrect: true),
      Answer(answer: 'Giraffe', isCorrect: false),
      Answer(answer: 'Hippopotamus', isCorrect: false),
    ],
  ),
  Quiz(
    
    question: 'Which planet is known as the "Red Planet"?',
    answerList: [
      Answer(answer: 'Venus', isCorrect: false),
      Answer(answer: 'Mars', isCorrect: true),
      Answer(answer: 'Jupiter', isCorrect: false),
      Answer(answer: 'Uranus', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the currency of Japan?',
    answerList: [
      Answer(answer: 'Yuan', isCorrect: false),
      Answer(answer: 'Pound', isCorrect: false),
      Answer(answer: 'Yen', isCorrect: true),
      Answer(answer: 'Euro', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which famous scientist developed the theory of relativity?',
    answerList: [
      Answer(answer: 'Isaac Newton', isCorrect: false),
      Answer(answer: 'Galileo Galilei', isCorrect: false),
      Answer(answer: 'Albert Einstein', isCorrect: true),
      Answer(answer: 'Nikola Tesla', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'What is the tallest mountain in the world?',
    answerList: [
      Answer(answer: 'Kilimanjaro', isCorrect: false),
      Answer(answer: 'Mount Everest', isCorrect: true),
      Answer(answer: 'Mount Fuji', isCorrect: false),
      Answer(answer: 'Mount McKinley', isCorrect: false),
    ],
  ),
  Quiz(
    question: 'Which gas do plants use for photosynthesis?',
    answerList: [
      Answer(answer: 'Oxygen', isCorrect: false),
      Answer(answer: 'Carbon Dioxide', isCorrect: true),
      Answer(answer: 'Nitrogen', isCorrect: false),
      Answer(answer: 'Hydrogen', isCorrect: false),
    ],
  ),
];