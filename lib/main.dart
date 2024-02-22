import 'package:assignment/firebase_options.dart';
import 'package:assignment/provider/theme_provider.dart';
import 'package:assignment/theme/theme.dart';
import 'package:assignment/view/screen/bottom_navigation.dart';
import 'package:assignment/view/screen/signup_screen.dart';
import 'package:assignment/view/screen/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/auth_provider.dart';

late Size mq;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider(),)
        ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: Provider.of<ThemeProvider>(context).themeData,

      navigatorKey: navigatorKey,
      routes: {
        '/': (context) => SplashScreen(),
        'loginpage': (context) => SignupScreen(),
        'homepage': (context) => MyHomePage(),
      },
    );
  }
}
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();