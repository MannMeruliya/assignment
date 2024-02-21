import 'package:assignment/main.dart';
import 'package:assignment/view/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SignupScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: mq.width * .2,
              right: mq.width * .2,
              top: mq.height * .2,
              child: Image.asset(
                'assets/image/logo.png',height: 180,
              )),
          Positioned(
            bottom: mq.height * .15,
            left: mq.width * .2,
            right: mq.width * .2,
            child: Lottie.asset('assets/animation/loading.json',height: 170),
          ),
        ],
      ),
    );
  }
}
