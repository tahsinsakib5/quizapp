// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Adminquiz extends StatefulWidget {
  const Adminquiz({super.key});

  @override
  State<Adminquiz> createState() => _AdminquizState();

}

TextEditingController question =TextEditingController();
TextEditingController controller1 =TextEditingController();

TextEditingController controller2 =TextEditingController();

TextEditingController controller3 =TextEditingController();
TextEditingController controller4 =TextEditingController();

bool isvalue1=false;
bool isvalue2=false;
bool isvalue3=false;
bool isvalue4=false;


class _AdminquizState extends State<Adminquiz> {
  @override
  
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: 600,
          width: double.infinity,
        child: ListView(
            children: [
              TextFormField(controller: question,  decoration: InputDecoration(helperText:"Quation"),),

             Row(
              children: [
                Expanded(child: 
                TextFormField(
                 controller: controller1,
                ),
                
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    isvalue1=!isvalue1;
                  });
                }, child:Text(isvalue1?"true":"false"))
              ],
             ),

             Row(
              children: [
                Expanded(child: 
                TextFormField(
                     controller: controller2,
                ),
                
                ),
                ElevatedButton(onPressed: (){
                 setState(() {
                   
                    isvalue2=!isvalue2;
                 });
                }, child:Text(isvalue2?"true":"false"))
              ],
             ),

             Row(
              children: [
                Expanded(child: 
                TextFormField(
                     controller: controller3,
                ),
                
                ),
                ElevatedButton(onPressed: (){
                 setState(() {
                    isvalue3=!isvalue3;
                 });
                }, child:Text(isvalue3?"true" :"false"))
              ],
             ),


             Row(
              children: [
                Expanded(child: 
                TextFormField(
                   controller: controller4,
                ),
                
                ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    isvalue4=!isvalue4;
                  });
                }, child:Text(isvalue4? "true": "false"))
              ],
             ),

             ElevatedButton(onPressed: () {
               addDataToDB();
             }, child: Text("Add data by textfield"))
            ],
        ),

        
      ),
      
    );
  }

 Future<void> addDataToDB() async {
    var collection = await FirebaseFirestore.instance.collection('add_data');

    //A Quiz as Map
    Map<String, dynamic> quizMap = {
      'question':question.text,
      'answerList': [
        {'answer':controller1.text, 'isCorrect':isvalue1},
        {'answer':controller2.text, 'isCorrect': isvalue2},
        {'answer':controller3.text, 'isCorrect': isvalue3},
        {'answer':controller4.text, 'isCorrect':isvalue4},
      ]
    };
    //Simple Data
    // var data = {'quiestion': 'What is the capital Of Bangladesh'};

    await collection.add(quizMap);
  }
}