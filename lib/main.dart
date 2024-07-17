import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:yuki_club_web/materials/colors.dart';

import './MyApp.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyCcDle3v-4nfMDR-pRtrueKhL5KE5xY1pI',
      appId: '1:825033090624:web:f6e8b382c9bf74760e61a5',
      messagingSenderId: '',
      projectId: 'miyuki-b1c80',
      storageBucket: 'miyuki-b1c80.appspot.com',
      databaseURL: 'https://miyuki-b1c80-default-rtdb.firebaseio.com',
    ),
  );
  final runnableApp = _buildRunnableApp(
    isWeb: kIsWeb,
    webAppWidth: 700.0,
    app: const MyApp(),
  );

  runApp(runnableApp);
}

Widget _buildRunnableApp({
  required bool isWeb,
  required double webAppWidth,
  required Widget app,
}) {
  if (!isWeb) {
    return app;
  }

  return Container(
    color: theme_purple,
    child: Center(
      child: ClipRect(
        child: SizedBox(
          width: webAppWidth,
          child: app,
        ),
      ),
    ),
  );
}
