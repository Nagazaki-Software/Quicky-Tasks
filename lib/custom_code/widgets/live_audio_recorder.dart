// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

import 'dart:async';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:permission_handler/permission_handler.dart';

class LiveAudioRecorder extends StatefulWidget {
  final double width;
  final double height;

  const LiveAudioRecorder({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _LiveAudioRecorderState createState() => _LiveAudioRecorderState();
}

class _LiveAudioRecorderState extends State<LiveAudioRecorder> {
  late final RecorderController recorderController;
  bool isRecording = false;
  bool hasPermission = false;
  Timer? timer;
  int recordDuration = 0;
  String recordedPath = '';

  @override
  void initState() {
    super.initState();
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _checkPermission();
      if (hasPermission) {
        startRecording();
      }
    });
  }

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.request();
    setState(() {
      hasPermission = status == PermissionStatus.granted;
    });

    if (!hasPermission && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permissão de microfone negada.")),
      );
    }
  }

  void startRecording() async {
    if (!hasPermission || isRecording) return;

    await recorderController.record();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => recordDuration++);
    });
    setState(() {
      isRecording = true;
      recordedPath = '';
    });
  }

  void stopRecording() async {
    if (!isRecording) return;

    final path = await recorderController.stop();
    recordedPath = path ?? '';
    timer?.cancel();
    setState(() {
      isRecording = false;
      recordDuration = 0;
    });
  }

  String formatDuration(int seconds) {
    final min = (seconds ~/ 60).toString().padLeft(2, '0');
    final sec = (seconds % 60).toString().padLeft(2, '0');
    return '$min:$sec';
  }

  @override
  void dispose() {
    timer?.cancel();
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isRecording)
            AudioWaveforms(
              enableGesture: false,
              size: Size(widget.width, widget.height),
              recorderController: recorderController,
              waveStyle: const WaveStyle(
                waveColor: Color.fromARGB(255, 24, 24, 24),
                extendWaveform: true,
                showMiddleLine: false,
                spacing: 6.0,
                showBottom: true,
              ),
            ),
          if (isRecording)
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                formatDuration(recordDuration),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
