import 'package:flutter/material.dart';
import 'package:news/screens/News_details/news_details.dart';
import 'package:news/utitis/context_extentions.dart';
import 'package:news/widgets/cutome_text_field.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  String? search;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.w * 0.02,
          vertical: context.h * 0.01,
        ),
        child: Column(
          children: [
            CustomTextField(
              text: "Search",
              onChanging: (value) {
                setState(() {
                  search = value;
                });
              },
              prefix: Icon(
                Icons.search,
                size: 24,
                color: context.theme.splashColor,
              ),
            ),
            SizedBox(height: context.h*0.02),
            if (search != null && search!.isNotEmpty)
              Expanded(
                child: NewsDetails(
                  searchQuery: search,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
