import 'package:flutter/material.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:news/utitis/context_extentions.dart';

class SelectedItem extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const SelectedItem({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.w*0.04),
      padding: EdgeInsets.symmetric(horizontal: context.w*0.04),
        height: context.h * 0.06,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(16),
          border: Border.all(
            color: AppColors.whiteColor,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.white),
            ),
            IconButton(
              onPressed: onPressed, 
              icon: Icon(Icons.arrow_drop_down_rounded), 
              iconSize: 30,color: AppColors.whiteColor,
            )
          ],
        ),
      );
  }
}
