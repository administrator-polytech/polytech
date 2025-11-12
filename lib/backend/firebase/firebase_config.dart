import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCnsbn_8R4QqngwmEr4Aad7N0bupkM7TKo",
            authDomain: "polytech-2c42e.firebaseapp.com",
            projectId: "polytech-2c42e",
            storageBucket: "polytech-2c42e.firebasestorage.app",
            messagingSenderId: "1029325376743",
            appId: "1:1029325376743:web:ac84ee1543524b974da642",
            measurementId: "G-SWWK096FZP"));
  } else {
    await Firebase.initializeApp();
  }
}
