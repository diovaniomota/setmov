import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCofnD8WItWQfZN5yRN6tXEoVDYwLMICS8",
            authDomain: "set-mov-mciu6e.firebaseapp.com",
            projectId: "set-mov-mciu6e",
            storageBucket: "set-mov-mciu6e.firebasestorage.app",
            messagingSenderId: "773235438796",
            appId: "1:773235438796:web:d6535f744cd087fe94be69",
            measurementId: "G-KYQBJW3C0K"));
  } else {
    await Firebase.initializeApp();
  }
}
