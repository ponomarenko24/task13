import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AsyncApiScreen extends StatefulWidget {
  const AsyncApiScreen({super.key});

  @override
  AsyncApiScreenState createState() => AsyncApiScreenState();
}

class AsyncApiScreenState extends State<AsyncApiScreen> {
  String _statusMessage = "Натисніть, щоб розпочати";

  Future<String> fetchDataFromApi() async {
    try {
      setState(() {
        _statusMessage = "Етап 1: Ініціалізація...";
      });
      await Future.delayed(Duration(seconds: 2));

      setState(() {
        _statusMessage = "Етап 2: Виконується запит до API...";
      });
      await Future.delayed(Duration(seconds: 2));

      if (Random().nextInt(10) == 0) {
        throw ("Помилка при зверненні до API!");
      }

      setState(() {
        _statusMessage = "Етап 3: Завантаження результату...";
      });
      await Future.delayed(Duration(seconds: 3));

      return "Дані успішно отримані!";
    } catch (e) {
      return e.toString();
    }
  }

  void _startProcess() async {
    setState(() {
      _statusMessage = "Розпочато...";
    });

    String result = await fetchDataFromApi();
    setState(() {
      _statusMessage = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Імітація асинхронного API')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  _statusMessage,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _startProcess,
              child: Text('Запустити процес'),
            ),
          ],
        ),
      ),
    );
  }
}
