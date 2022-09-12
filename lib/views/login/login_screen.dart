import 'package:cblaze_task/constants/colors.dart';
import 'package:cblaze_task/main.dart';
import 'package:cblaze_task/services/api_services.dart';
import 'package:cblaze_task/views/dashboard/dashboard_screen.dart';
import 'package:cblaze_task/widgets/bottom_message_widegt.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordVisible = true;
  bool isLogging = false;

  final codeController = TextEditingController();
  final passwordController = TextEditingController();

  final codeFocus = FocusNode();
  final passwordFocus = FocusNode();

  InputDecoration decoration(
          {required String label, required bool isPassword}) =>
      InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.black54),
          suffixIcon: isPassword
              ? InkWell(
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  child: Icon(
                    !passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: red,
                  ),
                )
              : null,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: red, width: 2)),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: red, width: 1)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: red, width: 1)));

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: red,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: w,
            height: h,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    height: h * .65,
                    width: w,
                    decoration: const BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text(
                                "Student Login",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "User Code",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: codeController,
                            focusNode: codeFocus,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            decoration:
                                decoration(label: "Code", isPassword: false),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "User Password",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passwordController,
                            focusNode: passwordFocus,
                            obscureText: passwordVisible,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                            decoration:
                                decoration(label: "Password", isPassword: true),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  width: w,
                                  child: ElevatedButton(
                                    onPressed: isLogging
                                        ? () {}
                                        : () {
                                            login();
                                          },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: red,
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero)),
                                    child: isLogging
                                        ? const SpinKitSpinningLines(
                                            color: Colors.white,
                                            size: 40.0,
                                            lineWidth: 3,
                                            duration:
                                                Duration(milliseconds: 2300),
                                          )
                                        : const Text(
                                            "SingIn",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: h * .1,
                  right: w * .38,
                  left: w * .38,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: SizedBox(
                      child: Image.asset("assets/images/red_logo.png"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  login() {
    if (codeController.text.isNotEmpty) {
      if (passwordController.text.isNotEmpty) {
        codeFocus.unfocus();
        passwordFocus.unfocus();
        setState(() {
          isLogging = true;
        });
        var map = {
          "code": codeController.text,
          "password": passwordController.text
        };
        ApiServices().login(map).then((Response response) {
          if (response.statusCode == 200) {
            String token = response.data['data']['token'] as String;
            storage.write(key: "token", value: token);

            print(token);
            setState(() {
              isLogging = false;
            });
            showBottomMessage(
              isError: false,
              context: context,
              message: "Login Successful",
            );
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (_) => const DashBoardScreen()),(route) => false,);
          } else {
            setState(() {
              isLogging = false;
            });
            showBottomMessage(
              isError: true,
              context: context,
              message: "User code/password is wrong",
            );
          }
        });
      } else {
        showBottomMessage(
          isError: true,
          context: context,
          message: "Enter your password",
        );
      }
    } else {
      showBottomMessage(
        isError: true,
        context: context,
        message: "Enter your valid user code",
      );
    }
  }
}
