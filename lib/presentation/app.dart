import 'package:flutter/material.dart';
import 'package:xam_consulting_exam/presentation/screens/new_diary_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 245, 252, 252),
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(const Color.fromARGB(255, 151, 214, 0)),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
      home: const NewDiaryScreen(),
    );
  }
}
