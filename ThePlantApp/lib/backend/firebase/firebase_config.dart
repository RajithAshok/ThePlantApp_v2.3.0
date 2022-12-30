import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCRXNXoyZhOHGmjQNgLSUDdQIOG1WZnhRA",
            authDomain: "the-plant-app-894f6.firebaseapp.com",
            projectId: "the-plant-app-894f6",
            storageBucket: "the-plant-app-894f6.appspot.com",
            messagingSenderId: "466130865078",
            appId: "1:466130865078:web:e352bdcd4a412dbeedcf17"));
  } else {
    await Firebase.initializeApp();
  }
}
