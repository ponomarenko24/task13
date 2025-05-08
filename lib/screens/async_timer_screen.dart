import 'dart:async';
import 'package:flutter/material.dart';

class AsyncTimerScreen extends StatefulWidget {
  const AsyncTimerScreen({super.key});

  @override
  AsyncTimerScreenState createState() => AsyncTimerScreenState();
}

class AsyncTimerScreenState extends State<AsyncTimerScreen> {
  Stream<int> countdownTimer(int seconds) async* {
    try {
      for (int i = seconds; i >= 0; i--) {
        await Future.delayed(Duration(seconds: 1));
        yield i;
      }
    } catch (e) {
      throw Exception("Помилка під час роботи таймера!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Асинхронний таймер'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: StreamBuilder<int>(
            stream: countdownTimer(10),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(
                  'Помилка: ${snapshot.error}',
                  style: TextStyle(color: Colors.red, fontSize: 20),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text(
                  'Запуск таймера...',
                  style: TextStyle(fontSize: 24),
                );
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return Text(
                  'Таймер завершено!',
                  style: TextStyle(fontSize: 24, color: Colors.green),
                );
              }
              return Text(
                'Залишилось: ${snapshot.data} секунд',
                style: TextStyle(fontSize: 28),
              );
            },
          ),
        ),
      ),
    );
  }
}
