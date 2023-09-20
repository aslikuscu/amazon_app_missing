import 'package:amazon_clone/screens/sign_in_screen.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyDY10J-cn49CxYdRTcWicy-IMZu99TNztc",
      authDomain: "clone-614fe.firebaseapp.com",
      projectId: "clone-614fe",
      storageBucket: "clone-614fe.appspot.com",
      messagingSenderId: "265129612782",
      appId: "1:265129612782:web:5f08eeb833ec519c0c2aff",
    ));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light()
            .copyWith(scaffoldBackgroundColor: backgroundColor),
        title: "Amazon Clone",
        debugShowCheckedModeBanner: false,
        home: SignInScreen());
  }
}
