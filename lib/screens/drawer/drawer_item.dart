import 'package:flutter/material.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:news/utitis/app_styles.dart';
import 'package:news/utitis/context_extentions.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const DrawerItem({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(horizontal: context.w*0.02),
      child: Row(
        children: [
          Icon(icon,color: AppColors.whiteColor,),
          const SizedBox(width: 12),
          Text(
            text,
            style: AppStyles.bold20white,
          ),
        ],
      ),
    );
  }
}
