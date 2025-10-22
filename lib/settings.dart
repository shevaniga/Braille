import 'package:flutter/material.dart';
import 'voice_assistant.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isDarkMode = false;
  double fontSize = 16.0;
  bool voiceFeedback = true;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          backgroundColor: const Color.fromARGB(255, 223, 164, 109),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "App Preferences",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // 🌙 Toggle Theme (Light/Dark)
              SwitchListTile(
                title: const Text("Dark Mode"),
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),

              // Adjust Font Size 
              ListTile(
                title: const Text("Font Size"),
                subtitle: Slider(
                  value: fontSize,
                  min: 12,
                  max: 24,
                  divisions: 6,
                  label: fontSize.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      fontSize = value;
                    });
                  },
                ),
              ),

              // Language Selection 
              ListTile(
                title: const Text("Language"),
                trailing: DropdownButton<String>(
                  value: selectedLanguage,
                  items: ["English", "French", "Spanish", "Tamil", "Hindi"]
                      .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
                    });
                  },
                ),
              ),

              // 🎙 Voice Feedback Toggle
              SwitchListTile(
                title: const Text("Voice Feedback"),
                value: voiceFeedback,
                onChanged: (value) {
                  setState(() {
                    voiceFeedback = value;
                  });
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: const VoiceAssistant(),
      ),
    );
  }
}
