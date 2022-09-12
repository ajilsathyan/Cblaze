import 'package:cblaze_task/constants/colors.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 50),
      child: Divider(
        color: red,
        thickness: 0.5,
      ),
    );
  }
}
