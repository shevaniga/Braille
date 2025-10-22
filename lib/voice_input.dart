import 'package:flutter/material.dart';
import 'voice_assistant.dart'; // Import the voice assistant

class VoiceInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Input'),
        backgroundColor: Color.fromARGB(255, 223, 164, 109),
      ),
      body: const Center(
        child: Text(
          'This is the Voice Input Page',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: const VoiceAssistant(), // Add the assistant
    );
  }
}
