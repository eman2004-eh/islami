import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/tabs/hadeth/hadeth_details_screen.dart';
import 'package:islami/tabs/quran/sura_service.dart';
import 'package:islami/tabs/quran/sura.dart'; // Ensure Sura class is imported

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await SuraService.getMostRecently();
  } catch (e) {
    print('Error loading most recently accessed Surahs: $e');
  }
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomeScreen.routeName:
            return MaterialPageRoute(builder: (_) => HomeScreen());
          case SuraDetailsScreen.routeName:
            final sura = settings.arguments
                as Sura; // Assuming Sura is passed as an argument
            return MaterialPageRoute(
              builder: (_) => SuraDetailsScreen(sura: sura),
            );
          case HadethDetailsScreen.routeName:
            final hadeth = settings.arguments
                as String; // Assuming Hadeth is passed as an argument
            return MaterialPageRoute(
              builder: (_) => HadethDetailsScreen(hadeth: hadeth),
            );
          default:
            return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}

class SuraDetailsScreen extends StatelessWidget {
  static const routeName = '/suraDetails';

  final Sura sura;

  const SuraDetailsScreen({super.key, required this.sura});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(sura.englishName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Arabic Name: ${sura.arabicName}'),
            Text('Number of Ayat: ${sura.ayatCount}'),
            Text('Sura Number: ${sura.num}'),
          ],
        ),
      ),
    );
  }
}
