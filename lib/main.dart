import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/ui/pages.dart';
import 'package:task_manager/ui/ui/test_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDDoBxCj9YA5gsl-ysZAX-g5vtfEgpPNiE',
      appId: '1:616180244668:android:56336075e99a7d8dd430b9',
      messagingSenderId: '616180244668',
      projectId: 'auth-37f8b',
    ),
  );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/register': (context) => Register(),
        '/login': (context) => Login(),
        '/home': (context) => HomePage(),
        '/test': (context) => TestPage(),
      },
    );
  }
}
