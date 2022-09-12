import 'package:another_flushbar/flushbar.dart';
import 'package:cblaze_task/constants/colors.dart';
import 'package:flutter/material.dart';

showBottomMessage(
    {required String message,
    required bool isError,
    required BuildContext context}) {
  return Flushbar(
    title: "Message",
    message: message,
    backgroundColor: isError ? red : green,
    duration: const Duration(seconds: 3),
  )..show(context);
}
