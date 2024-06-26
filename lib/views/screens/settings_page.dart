import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: ClipOval(
            child: Image.asset('lib/assets/profile_pic1.png')),
        ),
      ],
    );
  }
}
