import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/firebase_options.dart';
import 'package:diary_app/root_widget_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  runApp(
    const RootWidgetPage(),
  );
}
