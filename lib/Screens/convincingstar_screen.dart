import 'package:audioplayers/audioplayers.dart';
import 'package:blockbuster_hunt/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';

class ConvincingstarScreen extends StatefulWidget {
  const ConvincingstarScreen({super.key});

  @override
  State<ConvincingstarScreen> createState() => _ConvincingstarScreenState();
}

class _ConvincingstarScreenState extends State<ConvincingstarScreen> {
    late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _initializeAudioPlayer();
  }

  Future<void> _initializeAudioPlayer() async {
    _audioPlayer = AudioPlayer();

    // Enable background mode
    await FlutterBackground.initialize();
    await FlutterBackground.enableBackgroundExecution();

    // Load audio and set to loop
    await _audioPlayer.setSource(AssetSource('convince.mp3'));
    _audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  void _playAudio() async {
    await _audioPlayer.resume();
   
  }

  void _pauseAudio() async {
    await _audioPlayer.pause();
   
  }

  void _stopAudio() async {
    await _audioPlayer.stop();
   
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    FlutterBackground.disableBackgroundExecution();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kblack,
      body: SafeArea(
        
        child: Stack(
          children: [
            const SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image(image: AssetImage('assets/sureshkrishna.png')),
            ),
          
             
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _playAudio,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text("Stop"),
              ),
          ],
        ),
      )
    );
  }
}
