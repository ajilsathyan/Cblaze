import 'package:cblaze_task/constants/colors.dart';
import 'package:flutter/material.dart';

class UserDataRowWidget extends StatelessWidget {
  IconData icon;
  String title;
  UserDataRowWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: red,
      onTap: () {},
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Icon(
              icon,
              color: red,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward,
              color: red,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
