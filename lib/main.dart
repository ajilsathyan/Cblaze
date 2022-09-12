import 'package:cblaze_task/controller/profiledata_controller.dart';
import 'package:cblaze_task/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

const storage = FlutterSecureStorage();

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ProfileDataControllerProvider()),
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBlaze',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
