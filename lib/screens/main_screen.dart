import 'package:flutter/material.dart';
import 'package:task_13/screens/async_api_screen.dart';
import 'package:task_13/screens/async_chat_bot_screen.dart';
import 'package:task_13/screens/async_timer_screen.dart';
import 'package:task_13/screens/real_time_data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  final double sizedboxHight = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AsyncChatBotScreen()),
                );
              },
              child: Text("Task 1"),
            ),
            SizedBox(height: sizedboxHight),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AsyncTimerScreen()),
                );
              },
              child: Text("Task 2"),
            ),
            SizedBox(height: sizedboxHight),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RealTimeDataScreen()),
                );
              },
              child: Text("Task 3"),
            ),
            SizedBox(height: sizedboxHight),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AsyncApiScreen()),
                );
              },
              child: Text("Task 4"),
            ),
            SizedBox(height: sizedboxHight),
          ],
        ),
      ),
    );
  }
}
