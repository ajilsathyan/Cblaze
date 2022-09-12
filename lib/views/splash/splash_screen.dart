import 'package:cblaze_task/constants/colors.dart';
import 'package:cblaze_task/main.dart';
import 'package:cblaze_task/views/dashboard/dashboard_screen.dart';
import 'package:cblaze_task/views/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool userLoginStatus = false;

  @override
  void initState() {
    checkUserLoginStatus();
    Future.delayed(const Duration(seconds: 3), () {
      userLoginStatus
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_) => const DashBoardScreen()))
          : Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const LoginScreen()));
    });
    super.initState();
  }

  checkUserLoginStatus() async {
    String? token = await storage.read(key: "token");
    if (token != null) {
      userLoginStatus = true;
    } else {
      userLoginStatus = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/images/red_logo.png"),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Welcome To CBlaze",
              style: TextStyle(
                  color: white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              height: 50,
              width: 50,
              child: SpinKitSpinningLines(
                color: Colors.white,
                size: 50.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
