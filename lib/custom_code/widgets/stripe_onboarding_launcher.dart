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

import 'package:url_launcher/url_launcher.dart';

class StripeOnboardingLauncher extends StatefulWidget {
  final String onboardingUrl;

  const StripeOnboardingLauncher({
    Key? key,
    required this.onboardingUrl,
  }) : super(key: key);

  @override
  State<StripeOnboardingLauncher> createState() =>
      _StripeOnboardingLauncherState();
}

class _StripeOnboardingLauncherState extends State<StripeOnboardingLauncher> {
  @override
  void initState() {
    super.initState();
    _openUrl();
  }

  Future<void> _openUrl() async {
    final url = Uri.parse(widget.onboardingUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      print('Não foi possível abrir a URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
