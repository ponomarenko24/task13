import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class AsyncChatBotScreen extends StatefulWidget {
  const AsyncChatBotScreen({super.key});

  @override
  AsyncChatBotScreenState createState() => AsyncChatBotScreenState();
}

class AsyncChatBotScreenState extends State<AsyncChatBotScreen> {
  final TextEditingController _controller = TextEditingController();
  String _response = '';

  Future<String> simulateChatResponse(String question) async {
    int delay = 2000 + Random().nextInt(2000);
    await Future.delayed(Duration(milliseconds: delay));

    if (question.contains('погано')) {
      return "Щось пішло не так! Спробуйте ще раз.";
    }

    if (question.contains('добре')) {
      return "Я радий, що вам подобається!";
    }

    if (question.contains('яка погода')) {
      await Future.delayed(Duration(seconds: 5));
      int temperature = 15 + Random().nextInt(15);
      return "Зараз приблизно $temperature°C.";
    }

    return "Я не знаю відповіді на це питання.";
  }

  void _getResponse() async {
    setState(() {
      _response = "Чекайте відповіді...";
    });

    try {
      String result = await simulateChatResponse(_controller.text);
      setState(() {
        _response = result;
      });
    } catch (e) {
      setState(() {
        _response = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Асинхронний чат-бот')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Введіть питання',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _getResponse, child: Text('Відправити')),
            SizedBox(height: 24),
            Text(
              _response,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
