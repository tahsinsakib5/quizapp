import 'package:firebasepoject/adminpanelquiz.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatelessWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Adminquiz(),
                  );
                },
                child: Text("addquiz")),

                
          ],
        ),
      ),
    );
  }
}
