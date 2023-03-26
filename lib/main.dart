import 'package:flutter/material.dart';
import 'package:rokave_notificaciones/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones App',
      initialRoute: 'home',
      routes: {
        'home':(_)=>HomeScreen(),
        'message':(_)=>MessageScreen()
      },
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Notificaciones'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}