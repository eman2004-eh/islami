import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';

void main() {
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

class SuraDetailsScreen extends StatelessWidget {
  static const routeName = '/suraDetails';

  const SuraDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sura Details'),
      ),
      body: Center(
        child: Text('Sura Details Screen'),
      ),
    );
  }
}
