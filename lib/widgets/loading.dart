import 'package:flutter/material.dart';
import 'package:news/utitis/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
            child: CircularProgressIndicator(color: AppColors.greyColor,),
    );
  }
}