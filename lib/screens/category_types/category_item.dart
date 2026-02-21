import 'package:flutter/material.dart';
import 'package:news/model/cateogory.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:news/utitis/context_extentions.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  int index;
  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Stack(
      alignment: index%2==0 ? Alignment.bottomRight:Alignment.bottomLeft,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              category.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
            top: context.h * 0.1,
            left: index % 2 == 0 ?  null : context.w * 0.04,
            right: index % 2 == 0 ? context.w * 0.04 : null,
            child: Text(category.title, style: textTheme.displayLarge,),
          ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: context.w*0.04,vertical: context.h*0.02),
          padding: EdgeInsetsDirectional.only(
            start: index%2==0 ? 0 : context.w*0.04,
            end: index%2==0 ? context.w*0.04 : 0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.greyColor
          ),
          child: Row(
            spacing: context.w*0.04,
            mainAxisSize: MainAxisSize.min,
            textDirection: index%2==0 ? TextDirection.rtl : TextDirection.ltr,
            children: [
              Text("View All",style: textTheme.headlineMedium,),
              CircleAvatar(
                radius: 25,
                backgroundColor: context.theme.primaryColor,
                child: Icon(index%2==0 ? Icons.arrow_forward_ios_rounded :Icons.arrow_back_ios_new_rounded ,color: context.theme.splashColor,)
              )
            ],
          ),
        )

      ],
    );
  }
}
