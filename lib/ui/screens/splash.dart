import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hall_management_client/data/utils/user_auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
      goToHomeScreen();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
  Future<void> goToHomeScreen() async {
    bool loggedIn=await AuthController.isLoggedIn();
    await Future.delayed(const Duration(seconds: 1));
    if(loggedIn){
      if(mounted){
        context.replace('/home');
      }
    }else{
      if (!mounted) return;
      context.replace('/login');
    }
  }
}

