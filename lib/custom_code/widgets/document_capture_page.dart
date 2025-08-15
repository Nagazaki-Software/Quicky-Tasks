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

import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class DocumentCapturePage extends StatefulWidget {
  final String uid; // Para Firestore
  final String accountId; // Para API externa
  final double width;
  final double height;

  DocumentCapturePage({
    required this.uid,
    required this.accountId,
    required this.width,
    required this.height,
  });

  @override
  _DocumentCapturePageState createState() => _DocumentCapturePageState();
}

class _DocumentCapturePageState extends State<DocumentCapturePage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isCapturing = false;
  bool _capturingFront = true;

  String? _frontImagePath;
  String? _backImagePath;
  bool _showMessage = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      setState(() => _isCapturing = true);
      await _initializeControllerFuture;

      final image = await _controller.takePicture();

      if (_capturingFront) {
        _frontImagePath = image.path;
        setState(() {
          _capturingFront = false;
        });
      } else {
        _backImagePath = image.path;
        await _sendDocuments();
      }

      setState(() => _isCapturing = false);
    } catch (e) {
      setState(() => _isCapturing = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erro ao capturar imagem: $e')),
      );
    }
  }

  Future<String> _uploadToFirebase(String localPath, String label) async {
    final file = File(localPath);
    final storageRef = FirebaseStorage.instance.ref().child(
        'documents/$label-${DateTime.now().millisecondsSinceEpoch}${path.extension(localPath)}');

    await storageRef.putFile(file);
    final downloadUrl = await storageRef.getDownloadURL();
    return downloadUrl;
  }

  Future<void> _sendDocuments() async {
    if (_frontImagePath == null || _backImagePath == null) return;

    try {
      final frontUrl = await _uploadToFirebase(_frontImagePath!, 'front');
      final backUrl = await _uploadToFirebase(_backImagePath!, 'back');

      final uri = Uri.parse(
          'https://us-central1-quick-b108e.cloudfunctions.net/verificationStripeWithCam');

      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: '''
        {
          "accountId": "${widget.accountId}",
          "frontUrl": "$frontUrl",
          "backUrl": "$backUrl"
        }
        ''',
      );

      if (response.statusCode == 200) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .update({'verifyaccount': true});

        if (mounted) {
          setState(() {
            _showMessage = true;
          });

          Future.delayed(const Duration(seconds: 4), () {
            if (mounted) {
              setState(() {
                _showMessage = false;
              });
            }
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Documentos enviados e verificados com sucesso!')),
          );
          Navigator.pop(context);
        }
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Erro ao enviar documentos: ${response.statusCode}')),
          );
          setState(() {
            _capturingFront = true;
            _frontImagePath = null;
            _backImagePath = null;
          });
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Falha no envio: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          _capturingFront
              ? "Capture a Frente do Documento"
              : "Capture o Verso do Documento",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
              },
            ),
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 700),
                child: _capturingFront
                    ? Container(
                        key: ValueKey('front'),
                        width: MediaQuery.of(context).size.width * 0.85,
                        height: MediaQuery.of(context).size.height * 0.35,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.greenAccent, width: 3),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.transparent,
                        ),
                        child: Icon(Icons.photo_camera,
                            color: Colors.greenAccent, size: 100),
                      )
                    : Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(3.14159),
                        child: Container(
                          key: ValueKey('back'),
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.35,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.greenAccent, width: 3),
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.transparent,
                          ),
                          child: CustomPaint(
                            painter: _BackSidePainter(),
                          ),
                        ),
                      ),
              ),
            ),
            if (_showMessage)
              Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  color: Colors.greenAccent,
                  child: Text(
                    'Documentos enviados e verificados com sucesso!',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: GestureDetector(
                  onTap: _isCapturing ? null : _takePicture,
                  child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.greenAccent, Colors.blueAccent],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: _isCapturing
                        ? const Center(
                            child: SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                  color: Colors.white, strokeWidth: 2),
                            ),
                          )
                        : const Icon(Icons.camera_alt,
                            color: Colors.white, size: 30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Pintor personalizado do verso
class _BackSidePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final fillPaint = Paint()
      ..color = Colors.white.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final rect = Rect.fromLTWH(
      size.width * 0.1,
      size.height * 0.2,
      size.width * 0.8,
      size.height * 0.6,
    );

    canvas.drawRect(rect, fillPaint);
    canvas.drawRect(rect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
