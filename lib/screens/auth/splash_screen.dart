import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:we_chat/api/apis.dart';
import 'package:we_chat/main.dart';
import 'package:we_chat/screens/auth/login_screen.dart';
import 'package:we_chat/screens/home_screen.dart';
// import 'package:we_chat/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
// splash screen -- implements google sign in or sign up features for app
class _SplashScreenState extends State<SplashScreen> {
 
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {

      // exit full-screen
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

      if(APIs.auth.currentUser!=null){
        developer.log('\nUser: ${APIs.auth.currentUser}');
        // navigate to home screen
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      }else{
         // navigate to login screen
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
      }

      
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //Initializing media query  for getting device screen size
    mq=MediaQuery.of(context).size;
    return Scaffold(
      //app bar
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Welcome to We Chat'),

      ),
      //body
      body: Stack(children: [
        Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset('images/icon.png')),

        //google login button
        Positioned(
            bottom: mq.height * .15,
            width: mq.width,   
            child: const Text('MADE IN INDIA WITH ❤️', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.black87, letterSpacing: .5),)),
  ]),
    );
  }
}