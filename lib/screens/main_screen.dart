import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final double spacerHight = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Task 1")),
            SizedBox(height: spacerHight),
            ElevatedButton(onPressed: () {}, child: Text("Task 2")),
            SizedBox(height: spacerHight),
            ElevatedButton(onPressed: () {}, child: Text("Task 3")),
            SizedBox(height: spacerHight),
            ElevatedButton(onPressed: () {}, child: Text("Task 4")),
            SizedBox(height: spacerHight),
          ],
        ),
      ),
    );
  }
}
