import 'package:flutter/material.dart';
import 'voice_assistant.dart';

class ReadAloudPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read Aloud'),
        backgroundColor: Color.fromARGB(255, 223, 164, 109),
      ),
      body: Center(
        child: Text(
          'This is the Read Aloud Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: const VoiceAssistant(),
    );
  }
}
