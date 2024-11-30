import 'dart:io';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:firebase_dart_admin_auth_sdk/firebase_dart_admin_auth_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_admin_auth_sample_app/screens/splash_screen/splash_screen.dart';

void main() async {
  // Initialize Firebase asynchronously
  WidgetsFlutterBinding.ensureInitialized();  // Ensure Flutter engine is initialized
  await initializeFirebase(); // Initialize Firebase here

  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  try {
    // If running on the web, initialize with environment variables
    if (kIsWeb) {
      await FirebaseApp.initializeAppWithEnvironmentVariables(
        apiKey: "AIzaSyD2s_1lUrN3PbND7DAT4WOWJJ08fMcq6V0",
        projectId: "extra-credit-21201",
      );
    } else if (Platform.isAndroid || Platform.isIOS) {
      // When running on mobile, initialize with the service account key using a relative path
      String serviceAccountKeyFilePath = 'assets/firebase/extra-credit-21201-firebase-adminsdk-z01j7-dfb6f54695.json';
      print("Using service account key from: $serviceAccountKeyFilePath");

      bool exists = await File(serviceAccountKeyFilePath).exists();
      print("Does the file exist? $exists");

      // Check if the file exists
      if (!exists) {
        throw Exception("Service account key file does not exist at the given path.");
      }

      // Initialize Firebase with the service account key
      await FirebaseApp.initializeAppWithServiceAccount(
        serviceAccountKeyFilePath: serviceAccountKeyFilePath,
      );
    }

    // Initialize FirebaseAuth
    FirebaseApp.instance.getAuth();
  } catch (e) {
  //   print('Error initializing Firebase: $e');
  //   rethrow; // Rethrow the error for debugging purposes
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auth Admin Demo',
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
