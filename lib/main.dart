import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_yolo_v2/detection_image_page.dart';
import 'package:flutter_yolo_v2/detection_realtime_page.dart';
import 'package:flutter_yolo_v2/home.dart';
import 'package:flutter_yolo_v2/homepage.dart';
import 'package:flutter_yolo_v2/splash.dart';
import 'package:flutter_yolo_v2/theme.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:newrelic_mobile/config.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:newrelic_mobile/newrelic_navigation_observer.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';
import 'package:go_router/go_router.dart';

late FlutterVision vision;
var appToken = "";

final router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/homepage',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePage();
          },
        ),
        GoRoute(
          path: '/detectionimage',
          builder: (BuildContext context, GoRouterState state) {
            return DetectionImagePage(
              vision: vision,
            );
          },
        ),
        GoRoute(
          path: '/detectionreal',
          builder: (BuildContext context, GoRouterState state) {
            return DetectionRealTimePage(
              vision: vision,
            );
          },
        ),
      ],
    ),
  ],
  observers: [NewRelicNavigationObserver()],
);

main() async {
  if (Platform.isIOS) {
    appToken = '<YOUR_IOS_TOKEN>';
  } else if (Platform.isAndroid) {
    appToken = 'AA1f5750ac129cd49814b26d1dbe5a41f8bd88f569-NRMA';
  }

  Config config = Config(
      accessToken: appToken,
      analyticsEventEnabled: true,
      networkErrorRequestEnabled: true,
      networkRequestEnabled: true,
      crashReportingEnabled: true,
      interactionTracingEnabled: true,
      httpResponseBodyCaptureEnabled: true,
      loggingEnabled: true,
      webViewInstrumentation: true,
      printStatementAsEventsEnabled: true,
      httpInstrumentationEnabled: true);

  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  DartPluginRegistrant.ensureInitialized();
  NewrelicMobile.instance.start(config, () {
    runApp(const MyApp());
  });

  runZonedGuarded(() async {
    FlutterError.onError = NewrelicMobile.onError;
    await NewrelicMobile.instance.startAgent(config);
    runApp(const MyApp());
  }, (Object error, StackTrace stackTrace) {
    NewrelicMobile.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    vision = FlutterVision();
  }

  @override
  void dispose() async {
    super.dispose();
    await vision.closeTesseractModel();
    await vision.closeYoloModel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [
        NewRelicNavigationObserver(),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: lightBackgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        '/homepage': (context) => const HomePage(),
        '/home': (context) => const MyHome(),
        '/detectionimage': (context) => DetectionImagePage(
              vision: vision,
            ),
        '/detectionreal': (context) => DetectionRealTimePage(
              vision: vision,
            ),
      },
    );
  }
}
