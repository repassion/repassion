import '/auth/auth_util.dart';
import '/components/privacy_banner_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'startup_model.dart';
export 'startup_model.dart';

class StartupWidget extends StatefulWidget {
  const StartupWidget({Key? key}) : super(key: key);

  @override
  _StartupWidgetState createState() => _StartupWidgetState();
}

class _StartupWidgetState extends State<StartupWidget>
    with TickerProviderStateMixin {
  late StartupModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  final animationsMap = {
    'imageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 1.0,
          end: 0.75,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 500.ms,
          begin: 1.0,
          end: 0.5,
        ),
        ScaleEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 1000.ms,
          begin: 1.0,
          end: 500.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 500.ms,
          begin: 0.5,
          end: 1.0,
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 500.ms,
          begin: 1.0,
          end: 0.0,
        ),
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 500.ms,
          duration: 1000.ms,
          begin: Offset(0.0, 0.0),
          end: Offset(75.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StartupModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'startup'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('STARTUP_PAGE_startup_ON_PAGE_LOAD');
      logFirebaseEvent('startup_custom_action');
      await actions.lockOrientation();
      if (valueOrDefault<bool>(currentUserDocument?.darkMode, false) == true) {
        logFirebaseEvent('startup_set_dark_mode_settings');
        setDarkModeSetting(context, ThemeMode.dark);
      } else {
        logFirebaseEvent('startup_set_dark_mode_settings');
        setDarkModeSetting(context, ThemeMode.light);
      }

      if (valueOrDefault(currentUserDocument?.privacyVersion, '') != '1.0') {
        logFirebaseEvent('startup_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Color(0x80F5F5F5),
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                height: MediaQuery.of(context).size.height * 1.0,
                child: PrivacyBannerWidget(),
              ),
            );
          },
        ).then((value) => setState(() => _model.privacy = value));

        if (!_model.privacy!) {
          return;
        }
      }
      logFirebaseEvent('startup_wait__delay');
      await Future.delayed(const Duration(milliseconds: 1000));
      if (valueOrDefault(currentUserDocument?.birthdate, '') != null &&
          valueOrDefault(currentUserDocument?.birthdate, '') != '') {
        if (valueOrDefault<bool>(currentUserDocument?.startupPassion, false) ==
            true) {
          logFirebaseEvent('startup_navigate_to');

          context.goNamed(
            'PassionOwn',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        } else {
          logFirebaseEvent('startup_navigate_to');

          context.goNamed(
            'Home',
            extra: <String, dynamic>{
              kTransitionInfoKey: TransitionInfo(
                hasTransition: true,
                transitionType: PageTransitionType.fade,
                duration: Duration(milliseconds: 0),
              ),
            },
          );
        }
      } else {
        logFirebaseEvent('startup_navigate_to');

        context.goNamed(
          'ProfileSetup1',
          extra: <String, dynamic>{
            kTransitionInfoKey: TransitionInfo(
              hasTransition: true,
              transitionType: PageTransitionType.fade,
              duration: Duration(milliseconds: 0),
            ),
          },
        );
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 1.0,
              constraints: BoxConstraints(
                maxWidth: 500.0,
                maxHeight: 1000.0,
              ),
              decoration: BoxDecoration(),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Image.asset(
                'assets/images/icon_512_2.png',
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ).animateOnPageLoad(animationsMap['imageOnPageLoadAnimation']!),
            ),
          ),
        ),
      ),
    );
  }
}
