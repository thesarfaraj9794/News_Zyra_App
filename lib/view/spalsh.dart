import 'package:flutter/material.dart';
class SpalshScreen extends StatelessWidget {
  const SpalshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 238, 146),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("News_app" ,style:TextStyle(fontSize: 30,color: Colors.redAccent,fontWeight: FontWeight.bold) ,),
            Image.asset("assets/images/images.png"),
          ],
        ),

      ),
      );

    
  }
}