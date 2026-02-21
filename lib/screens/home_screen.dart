import 'package:flutter/material.dart';
import 'package:news/model/cateogory.dart';
import 'package:news/screens/category_details/category_details.dart';
import 'package:news/screens/category_types/category_types.dart';
import 'package:news/screens/drawer/home_drawer.dart';
import 'package:news/utitis/app_colors.dart';
import 'package:news/utitis/app_routes.dart';
import 'package:news/utitis/context_extentions.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Category ? selectedCategory;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
         title: Text(  selectedCategory?.title ?? "Home",style: textTheme.headlineLarge,),
         actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, AppRoutes.searchRouteName);
            }, 
            icon: Icon(Icons.search, color: context.theme.splashColor,))
         ],
      ),
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(onHomeClick: onHomeClick,),
      ),
      body: selectedCategory == null
        ? CategoryTypes(
            onCateogoryClicked: onCateogoryClicked,
          )
        : CategoryDetails(category: selectedCategory!,),
   );
  }

  void onCateogoryClicked(Category newSelectedCateogory){
      selectedCategory = newSelectedCateogory;
      setState(() {
        
      });
  }
  void onHomeClick(){
      selectedCategory = null;
      
      setState(() {
        
      });
  }
}