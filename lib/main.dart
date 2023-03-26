import 'package:flutter/material.dart';
import 'package:rokave_notificaciones/screens/screens.dart';
import 'package:rokave_notificaciones/services/notificacions_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationPushers.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    print('ESTADO INICIAL');
    NotificationPushers.messageStream.listen((message) {
      print('MyAppE : $message');

      _navigatorKey.currentState?.pushNamed('message');

      final snackBar = SnackBar(content: Text(message));
      _scaffoldKey.currentState?.showSnackBar(snackBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notificaciones App',
      initialRoute: 'home',
      navigatorKey: _navigatorKey,
      scaffoldMessengerKey: _scaffoldKey,
      routes: {'home': (_) => HomeScreen(), 'message': (_) => MessageScreen()},
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
