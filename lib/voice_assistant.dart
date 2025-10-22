import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:dialogflow_grpc/dialogflow_grpc.dart';
import 'package:flutter/services.dart' show rootBundle;

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({super.key});

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _command = '';
  final FlutterTts _flutterTts = FlutterTts();

  DialogflowGrpcV2Beta1? dialogflow;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    initDialogFlow();
    Future.delayed(Duration.zero, _startListening);
  }

  Future<void> initDialogFlow() async {
    try {
      final serviceAccount = ServiceAccount.fromString(
        await rootBundle.loadString('assets/ai_assistant.json'),
      );
      dialogflow = DialogflowGrpcV2Beta1.viaServiceAccount(serviceAccount);
    } catch (e) {
      await _flutterTts.speak("Failed to initialize assistant.");
    }
  }

  void _startListening() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Speech Status: $status'),
      onError: (errorNotification) => print('Speech Error: $errorNotification'),
    );

    if (available) {
      setState(() => _isListening = true);

      _speech.listen(
        onResult: (val) {
          setState(() {
            _command = val.recognizedWords;
          });

          if (val.hasConfidenceRating && val.confidence > 0) {
            setState(() => _isListening = false);
            _respondToCommand(_command);
            Future.delayed(Duration.zero, _startListening);
          }
        },
        listenFor: const Duration(seconds: 60),
        pauseFor: const Duration(seconds: 5),
        onSoundLevelChange: (level) => print("Sound level: $level"),
      );
    }
  }

  void _respondToCommand(String command) async {
    try {
      if (dialogflow != null) {
        final response = await dialogflow!.detectIntent(command, 'en-US');
        final String reply = response.queryResult.fulfillmentText;
        final String? detectedIntent = response.queryResult.intent.displayName;

        if (reply.isNotEmpty) {
          await _flutterTts.speak(reply);
        } else {
          await _flutterTts.speak("Sorry, I didn't get that.");
        }

        switch (detectedIntent) {
          case 'OpenSettingsIntent':
            Navigator.pushNamed(context, '/settings');
            break;
          case 'OpenBrailleInputIntent':
            Navigator.pushNamed(context, '/braille_input');
            break;
          case 'OpenDocumentIntent':
            Navigator.pushNamed(context, '/document');
            break;
          case 'OpenLanguageSelectionIntent':
            Navigator.pushNamed(context, '/langsettings');
            break;
          case 'OpenReadAloudIntent':
            Navigator.pushNamed(context, '/read_aloud');
            break;
          case 'OpenVoiceInputIntent':
            Navigator.pushNamed(context, '/voice_input');
            break;
          default:
            debugPrint("No matching intent found");
        }
      }
    } catch (e) {
      await _flutterTts.speak("Error talking to assistant.");
      debugPrint("Dialogflow error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 100, // This lifts the button above your keyboard area
      right: 20, // Placing it slightly to the right for better UI
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 223, 164, 109),
        onPressed: _startListening,
        child: Icon(_isListening ? Icons.hearing : Icons.mic, size: 30),
      ),
    );
  }
}
