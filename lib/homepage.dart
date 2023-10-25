
// ignore_for_file: prefer_const_constructors, await_only_futures
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasepoject/adminpanel.dart';
import 'package:firebasepoject/delet.dart';
import 'package:firebasepoject/imagetest.dart';
import 'package:firebasepoject/quizscren.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          
          children: [

            ElevatedButton(onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => imagepage()));
            }, child: Text("quiz scren")),
            ElevatedButton(onPressed: (){
              addDataToDB();
            }, child:Text("Add data")),

            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPanel(),));
            }, child:Text("add data by textfield")),


            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Deletescren(),));
            }, child:Text("delete"))
          ],
        ),
      ),
    );
  }
  
 Future<void> addDataToDB() async {
    var collection = await FirebaseFirestore.instance.collection('add_data');

    //A Quiz as Map
    Map<String, dynamic> quizMap = {
      'question': 'What is the capital of France?',
      'answerList': [
        {'answer': 'Berlin', 'isCorrect': false},
        {'answer': 'London', 'isCorrect': false},
        {'answer': 'Paris', 'isCorrect': true},
        {'answer': 'Madrid', 'isCorrect': false},
      ]
    };
    //Simple Data
    // var data = {'quiestion': 'What is the capital Of Bangladesh'};

    collection.add(quizMap);
  }
  
 
}