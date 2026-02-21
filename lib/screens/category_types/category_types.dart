import 'package:flutter/material.dart';
import 'package:news/model/cateogory.dart';
import 'package:news/screens/category_types/category_item.dart';
import 'package:news/utitis/context_extentions.dart';


typedef OnCateogoryClicked = void Function(Category);
class CategoryTypes extends StatelessWidget {
  OnCateogoryClicked onCateogoryClicked;
  List<Category> categoriesList = [];
  CategoryTypes({super.key, required this.onCateogoryClicked});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    final isDark = context.watchTheme.isDarkMode();
    categoriesList = Category.getCategoriesList(isDark);

    return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: context.w * 0.04,
    ),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.h*0.02,
        children: [
          Text(
            'Good Morning\nHere is Some News For You',
            style: textTheme.headlineMedium,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
              return InkWell(
                onTap: () {
                   onCateogoryClicked(categoriesList[index]);
                },
                child: CategoryItem(category: categoriesList[index], index: index,)
              );
            }, 
            separatorBuilder: (context,index){
              return SizedBox(height: context.h*0.04,);
            },  
            itemCount: categoriesList.length
          ),
          SizedBox(height: context.h*0.04,)
        ],
      ),
    ),
  );
  }
}