import 'package:flutter/material.dart';
import 'package:prueba/Answers/answers_view.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Answers',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF1F2430),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    ),
  );
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Answers());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
