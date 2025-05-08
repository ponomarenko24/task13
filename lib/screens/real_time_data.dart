import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class RealTimeDataScreen extends StatefulWidget {
  const RealTimeDataScreen({super.key});

  @override
  RealTimeDataScreenState createState() => RealTimeDataScreenState();
}

class RealTimeDataScreenState extends State<RealTimeDataScreen> {
  final StreamController<int> _streamController = StreamController<int>();
  Timer? _timer;
  bool _isRunning = false;

  void startDataStream() {
    setState(() {
      _isRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      try {
        int value = Random().nextInt(100) + 1;
        if (value > 90) {
          throw Exception("Значення більше 90! ($value)");
        }
        _streamController.add(value);
      } catch (e) {
        _streamController.addError(e);
      }
    });
  }

  void stopDataStream() {
    setState(() {
      _isRunning = false;
    });
    _timer?.cancel();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Потокова обробка даних')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<int>(
              stream: _streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'Помилка: ${snapshot.error}',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  );
                }

                if (!snapshot.hasData) {
                  return Text(
                    'Очікування даних...',
                    style: TextStyle(fontSize: 24),
                  );
                }

                return Text(
                  'Поточне значення: ${snapshot.data}',
                  style: TextStyle(fontSize: 28),
                );
              },
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isRunning ? null : startDataStream,
                  child: Text('Старт'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _isRunning ? stopDataStream : null,
                  child: Text('Стоп'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
