

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';



class imagepage extends StatelessWidget {
   imagepage({super.key});

  String ? imageurl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: ()async{
             ImagePicker imagePicker = ImagePicker();
                    XFile? file =
                        await imagePicker.pickImage(source: ImageSource.gallery);
                    print('${file?.path}');

                    if (file == null) return;
                    //Import dart:core
                    String uniqueFileName =
                        DateTime.now().millisecondsSinceEpoch.toString();

                    /*Step 2: Upload to Firebase storage*/
                    //Install firebase_storage
                    //Import the library

                    //Get a reference to storage root
                    Reference referenceRoot = FirebaseStorage.instance.ref();
                    Reference referenceDirImages =
                        referenceRoot.child('image');

                    //Create a reference for the image to be stored
                    Reference referenceImageToUpload =
                        referenceDirImages.child('name');

                    //Handle errors/success
                    try {
                      //Store the file
                      await referenceImageToUpload.putFile(File(file!.path));
                      //Success: get the download URL
                      imageurl = await referenceImageToUpload.getDownloadURL();
                    } catch (error) {
                      //Some error occurred
                    }



          }, child:Icon(Icons.camera)),

          ElevatedButton(onPressed: () {
            addDataToDB();
          }, child:Text("save"))

          
        ],
      ),
    );
  }
 Future<void> addDataToDB() async {
    var collection = await FirebaseFirestore.instance.collection('add_data');

    //A Quiz as Map
    Map<String, dynamic> quizMap = {
      'question':imageurl,
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
