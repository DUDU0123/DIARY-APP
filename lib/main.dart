import 'package:diary_app/core/service_locator/service_locator.dart';
import 'package:diary_app/firebase_options.dart';
import 'package:diary_app/root_widget_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyA8CddWNFvy8GzE63Sy4OwuX4cBiIcX5wo',
        appId: '1:467235190090:web:55051096b132a5eb753db3',
        messagingSenderId: '467235190090',
        projectId: 'dialy-journal-app-project',
        authDomain: 'dialy-journal-app-project.firebaseapp.com',
        storageBucket: 'dialy-journal-app-project.appspot.com',
      ),
    );
  }
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await initDependencies();
  runApp(
    const RootWidgetPage(),
  );
}
