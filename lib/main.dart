import 'package:flutter/material.dart';
import 'home.dart';
import 'settings.dart';
import 'braille_input.dart';
import 'document.dart';
import 'Language_settings.dart';
import 'voice_input.dart';
import 'read_aloud.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Braille',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 223, 164, 109),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        '/settings': (context) => SettingsPage(),
        '/braille_input': (context) => BrailleInputPage(),
        '/langsettings': (context) => LanguageSettingsPage(),
        '/read_aloud': (context) => ReadAloudPage(),
        '/document': (context) => DocumentPage(),
        '/voice_input': (context) => VoiceInputPage(),
      },
    );
  }
}
