import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDlK2aQQjXzri5aI1DLcSXOiBw5Iq2eE08",
            authDomain: "shipping-47ce9.firebaseapp.com",
            projectId: "shipping-47ce9",
            storageBucket: "shipping-47ce9.firebasestorage.app",
            messagingSenderId: "621282972003",
            appId: "1:621282972003:web:9858f81ded9d4d2f480356",
            measurementId: "G-N2HS643M79"));
  } else {
    await Firebase.initializeApp();
  }
}
