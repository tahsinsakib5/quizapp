import 'package:firebasepoject/helpers.dart';
import 'package:flutter/material.dart';

class Deletescren extends StatelessWidget {
  const Deletescren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:FutureBuilder(
       
          future:Helpers.getAllQuiz(),
          builder: (context, snapshot) {
             if(snapshot.connectionState==ConnectionState.done){
              if(snapshot.data!=[]);

              return  Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount:snapshot.data!.length,
              itemBuilder: (context, index) {
                var carentquiz =snapshot.data![index];
                return ListTile(
                title: Text(carentquiz.question),
                trailing: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("are you sure"),
                                actions: [
                                  TextButton(onPressed: () {
                                    Navigator.pop(context);
                                  }, child: Text("no")),
                                   TextButton(onPressed: () {}, child: Text("yess"))
                                ],
                              ));
                    },
                    icon: Icon(Icons.delete)),
              );
              },
            )
          ],
        );
             }else{
              return Center(
                child:Text("no"),
              );
             }
          }
          
      ),
    );
  }
}
