import 'package:flutter/material.dart';
import 'package:note_app/core/constant/app_color.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomIcon({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: AppColor.grey),
        child: Icon(
          icon,
          size: 18,
          color: Colors.white,
        ),
      ),
    );
  }
}
