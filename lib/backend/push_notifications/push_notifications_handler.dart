import 'dart:async';

import 'serialization_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).primaryBackground,
          child: Center(
            child: Image.asset(
              'assets/images/Artboard_14.png',
              width: MediaQuery.sizeOf(context).width * 0.5,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'feedbackEventsTasker': ParameterData.none(),
  'Chat': (data) async => ParameterData(
        allParams: {
          'chat': getParameter<DocumentReference>(data, 'chat'),
        },
      ),
  'TaskeeRankingTasker': ParameterData.none(),
  'ConfiguracaoTasker': ParameterData.none(),
  'verifyYourAccount': ParameterData.none(),
  'quickySolutions': ParameterData.none(),
  'taskOverview': ParameterData.none(),
  'aboutapp': ParameterData.none(),
  'FinalRequestTask': (data) async => ParameterData(
        allParams: {
          'taskdo': getParameter<DocumentReference>(data, 'taskdo'),
        },
      ),
  'taskStepss': ParameterData.none(),
  'continueAs': ParameterData.none(),
  'TaskeeRanking': ParameterData.none(),
  'capturaDeCamera': ParameterData.none(),
  'PasswordTasker': ParameterData.none(),
  'QuickyTeamNotificacoesTaskee': ParameterData.none(),
  'ProfilePage': ParameterData.none(),
  'ConfiguracaoTaskee': ParameterData.none(),
  'createProfileTasker': ParameterData.none(),
  'Login': ParameterData.none(),
  'ConfiguracaoCopyCopyCopy': ParameterData.none(),
  'ProfilePageTasker': ParameterData.none(),
  'RequestCreateTask': (data) async => ParameterData(
        allParams: {
          'pretasks': getParameter<DocumentReference>(data, 'pretasks'),
        },
      ),
  'RatingsTaskeesCopy3': ParameterData.none(),
  'PhoneNumberCopy2Copy': ParameterData.none(),
  'CreateTask': ParameterData.none(),
  'taskOverviewTasker': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'RatingsTaskeesCopy': ParameterData.none(),
  'RatingsTasker': ParameterData.none(),
  'feedbackandEventsTasker': ParameterData.none(),
  'swipeTasker': ParameterData.none(),
  'PasswordTaskee': ParameterData.none(),
  'SelectTask': ParameterData.none(),
  'currentTasks': ParameterData.none(),
  'Progress': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'emailTasker': ParameterData.none(),
  'createProfile': ParameterData.none(),
  'fazendoTask': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'verifyYourAccountTasker': ParameterData.none(),
  'ChatTasker': (data) async => ParameterData(
        allParams: {
          'chat': getParameter<DocumentReference>(data, 'chat'),
        },
      ),
  'emailNotificacaoTasker': ParameterData.none(),
  'createaticket': ParameterData.none(),
  'emailTaskee': ParameterData.none(),
  'ADDPhotoCreateTask': (data) async => ParameterData(
        allParams: {
          'pretasks': getParameter<DocumentReference>(data, 'pretasks'),
        },
      ),
  'PhoneNumberTasker': ParameterData.none(),
  'getStarted': ParameterData.none(),
  'feedbackEventsTaskee': ParameterData.none(),
  'emailNotificacaoTaskee': ParameterData.none(),
  'QuickyTeamNotificacoesTasker': ParameterData.none(),
  'PhoneNumberTaskee': ParameterData.none(),
  'ratingsTaskee': ParameterData.none(),
  'PhoneNumberCopy2': ParameterData.none(),
  'RequestEvaluation': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
          'momento': getParameter<String>(data, 'momento'),
        },
      ),
  'LookingTasker': (data) async => ParameterData(
        allParams: {
          'task': getParameter<DocumentReference>(data, 'task'),
        },
      ),
  'helpcenter': ParameterData.none(),
  'perfildosusers': (data) async => ParameterData(
        allParams: {
          'users': getParameter<DocumentReference>(data, 'users'),
        },
      ),
  'editarperfildousuariotaskee': ParameterData.none(),
  'ChatCopy': (data) async => ParameterData(
        allParams: {
          'users': getParameter<DocumentReference>(data, 'users'),
        },
      ),
  'editarperfildousuariotasker': ParameterData.none(),
  'events': ParameterData.none(),
  'createNewEvent': ParameterData.none(),
  'quickySolutionsCopy': ParameterData.none(),
  'eventdetails': (data) async => ParameterData(
        allParams: {
          'envet': getParameter<DocumentReference>(data, 'envet'),
        },
      ),
  'instrutoraccession': (data) async => ParameterData(
        allParams: {
          'event': getParameter<DocumentReference>(data, 'event'),
        },
      ),
  'eventdetailsCopy': (data) async => ParameterData(
        allParams: {
          'envet': getParameter<DocumentReference>(data, 'envet'),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
