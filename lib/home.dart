import 'package:flutter/material.dart';
import 'voice_assistant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Braille'),
        backgroundColor: const Color.fromARGB(255, 223, 164, 109),
      ),
      body: const Center(
        child: Text(
          'Press the buttons below to navigate',
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 223, 164, 109),
                ),
                onPressed: () => Navigator.pushNamed(context, '/settings'),
              ),
              IconButton(
                icon: const Icon(
                  Icons.apps,
                  color: Color.fromARGB(255, 223, 164, 109),
                ),
                onPressed: () => Navigator.pushNamed(context, '/braille_input'),
              ),
              IconButton(
                icon: const Icon(
                  Icons.mic,
                  color: Color.fromARGB(255, 223, 164, 109),
                ),
                onPressed:
                    () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VoiceAssistant(),
                      ),
                    ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.language,
                  color: Color.fromARGB(255, 223, 164, 109),
                ),
                onPressed: () => Navigator.pushNamed(context, '/langsettings'),
              ),
              IconButton(
                icon: const Icon(
                  Icons.volume_up,
                  color: Color.fromARGB(255, 223, 164, 109),
                ),
                onPressed: () => Navigator.pushNamed(context, '/read_aloud'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 223, 164, 109),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VoiceAssistant()),
          );
        },
        child: const Icon(Icons.mic),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
