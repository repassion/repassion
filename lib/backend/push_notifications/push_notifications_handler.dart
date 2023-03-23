import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

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

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          params: parameterData.params,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/icon_512.png',
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
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

  Map<String, String> get params => Map.fromEntries(
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
  'Welcome': ParameterData.none(),
  'Login': ParameterData.none(),
  'Register': ParameterData.none(),
  'Reset': ParameterData.none(),
  'Home': ParameterData.none(),
  'PassionSearch': ParameterData.none(),
  'PassionFavorite': ParameterData.none(),
  'PassionOwn': ParameterData.none(),
  'CategoryWindow': (data) async {
    final allParams = {
      'category': getParameter<DocumentReference>(data, 'category'),
    };
    return ParameterData(
      requiredParams: {
        'category': serializeParam(
          allParams['category'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'PassionEdit': (data) async {
    final allParams = {
      'passion': getParameter<DocumentReference>(data, 'passion'),
    };
    return ParameterData(
      requiredParams: {
        'passion': serializeParam(
          allParams['passion'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'PassionWindow': (data) async {
    final allParams = {
      'passion': getParameter<DocumentReference>(data, 'passion'),
    };
    return ParameterData(
      requiredParams: {
        'passion': serializeParam(
          allParams['passion'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'Chat': ParameterData.none(),
  'ChatWindow': (data) async {
    final allParams = {
      'chat': getParameter<DocumentReference>(data, 'chat'),
    };
    return ParameterData(
      requiredParams: {
        'chat': serializeParam(
          allParams['chat'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'UserWindow': (data) async {
    final allParams = {
      'user': getParameter<DocumentReference>(data, 'user'),
    };
    return ParameterData(
      requiredParams: {
        'user': serializeParam(
          allParams['user'],
          ParamType.DocumentReference,
        ),
      },
      allParams: allParams,
    );
  },
  'Settings': (data) async => ParameterData(
        allParams: {
          'uid': getParameter<String>(data, 'uid'),
        },
      ),
  'ProfileWindow': ParameterData.none(),
  'TagWindow': (data) async => ParameterData(
        allParams: {
          'searchText': getParameter<String>(data, 'searchText'),
        },
      ),
  'AboutWindow': ParameterData.none(),
  'AccountWindow': ParameterData.none(),
  'ProfileSetup1': ParameterData.none(),
  'ProfileSetup2': ParameterData.none(),
  'ProfileSetup3': ParameterData.none(),
  'ProfileSetup4': (data) async => ParameterData(
        allParams: {
          'searchText': getParameter<String>(data, 'searchText'),
        },
      ),
  'ProfileSetup5': ParameterData.none(),
  'startup': ParameterData.none(),
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
