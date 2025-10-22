import 'package:flutter/material.dart';
import 'voice_assistant.dart';

class BrailleInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Braille Input'),
        backgroundColor: Color.fromARGB(255, 223, 164, 109),
      ),
      body:
          orientation == Orientation.landscape
              ? Container(
                width: screenWidth,
                height: screenHeight,
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildBrailleButton('1'),
                            SizedBox(height: 40),
                            _buildBrailleButton('2'),
                            SizedBox(height: 40),
                            _buildBrailleButton('3'),
                          ],
                        ),
                        _buildSpaceBar(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _buildBrailleButton('4'),
                            SizedBox(height: 40),
                            _buildBrailleButton('5'),
                            SizedBox(height: 40),
                            _buildBrailleButton('6'),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : Center(
                child: Text(
                  'Please switch to landscape mode.',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
      bottomNavigationBar: const VoiceAssistant(),
    );
  }

  Widget _buildBrailleButton(String text) {
    return GestureDetector(
      onTap: () {
        // Implement your Braille button functionality here
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 164, 109),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpaceBar() {
    return GestureDetector(
      onTap: () {
        // Implement your Space Bar functionality here
      },
      child: Container(
        width: 180,
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 164, 109),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'Space',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
