// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, unused_local_variable


import 'package:firebasepoject/allquid.dart';
import 'package:firebasepoject/helpers.dart';

import 'package:flutter/material.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int quizIndex = 0;

  int? selectedAnswerIndex;

  Color selectedColor = Colors.yellow;

  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<List<Quiz>>(
                future:Helpers.getAllQuiz(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != []) {
                      var allQuiz = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 70),
                          SizedBox(height: 20),
                          Text('${quizIndex + 1} / ${allQuiz.length}'),
                          Text(
                            allQuiz[quizIndex].question,
                            textScaleFactor: 1.2,
                          ),
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: allQuiz[quizIndex].answerList.length,
                                itemBuilder: ((context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedAnswerIndex = index;
                                      });
                                    },
                                    child: Card(
                                      color: index == selectedAnswerIndex
                                          ? selectedColor
                                          : Colors.blueAccent.shade700,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Center(
                                          child: Text(
                                            allQuiz[quizIndex]
                                                .answerList[index]
                                                .answer,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                })),
                          ),
                          Spacer(),
                          ElevatedButton(
                              onPressed: () async {
                                if (allQuiz[quizIndex]
                                        .answerList[selectedAnswerIndex!]
                                        .isCorrect ==
                                    true) {
                                  score += 10;

                                  setState(() {
                                    selectedColor = Colors.green;
                                  });
                                } else {
                                  setState(() {
                                    selectedColor = Colors.red;
                                  });
                                }

                                await Future.delayed(Duration(seconds: 2));

                                if (quizIndex < allQuiz.length - 1) {
                                  setState(() {
                                    quizIndex++;
                                    selectedColor = Colors.yellow;
                                    selectedAnswerIndex = null;
                                  });
                                } 
                              },
                              child: Text('Next Quiz')),
                          SizedBox(height: 70),
                          ElevatedButton(
                              onPressed: () {
                                // getAllQuiz();
                              },
                              child: Text('Get Data'))
                        ],
                      );
                    } else {
                      return Center(
                        child: Text('No Quiz'),
                      );
                    }
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ),
        ),
      ),
    );
  }
}
