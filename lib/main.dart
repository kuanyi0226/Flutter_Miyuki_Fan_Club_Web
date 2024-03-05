import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

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
  runApp(const MyApp());
}
