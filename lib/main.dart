import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Флаттер тыкалка'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _text = "Нажми на кнопку!";
  Color _bgColor = Colors.white;

  // Список фраз
  final List<String> _phrases = [
    "Привет, мир!",
    "КД, ЧД?!",
    "Ты нажал кнопку!",
    "Продолжай тыкать!",
    "Еще раз нажми!",
    "Вай красавчик!",
    "Последняя фраза!",
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeText() {
    setState(() {
      _text = _phrases[Random().nextInt(_phrases.length)];
    });
  }

  void _changeBackgroundColor() {
    setState(() {
      _bgColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _text,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Счётчик: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text("Тыкалка текста"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _changeBackgroundColor,
              child: const Text("Тыкалка фона"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _resetCounter,
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
