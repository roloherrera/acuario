import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBVNk0abf1ds4H33Zhc-CZtibXAoUYjoE4",
            authDomain: "acuario-2c1e4.firebaseapp.com",
            projectId: "acuario-2c1e4",
            storageBucket: "acuario-2c1e4.appspot.com",
            messagingSenderId: "724886463604",
            appId: "1:724886463604:web:806fc80faeaf6b6b4f5d21",
            measurementId: "G-FRVSRG7BM5"));
  } else {
    await Firebase.initializeApp();
  }
}
