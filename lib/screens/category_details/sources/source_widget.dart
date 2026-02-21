import 'package:flutter/material.dart';
import 'package:news/model/sources.dart';
import 'package:news/screens/News_details/news_details.dart';
import 'package:news/screens/category_details/sources/source_tab.dart';
import 'package:news/utitis/app_colors.dart';

class SourceWidget extends StatefulWidget {
  final List<Source> sourcesList;

  const SourceWidget({super.key, required this.sourcesList});

  @override
  State<SourceWidget> createState() => _SourceWidgetState();
}

class _SourceWidgetState extends State<SourceWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            onTap: (value){
              selectedIndex = value;
              setState(() {
                
              });
            },
            tabAlignment: TabAlignment.start,
            indicatorColor: Theme.of(context).splashColor,
            dividerColor: AppColors.transparentColor,
            tabs: 
             widget.sourcesList.map((source) { return SourceTab(source: source, isSelected: selectedIndex == widget.sourcesList.indexOf(source));}).toList()
          ,),
          Expanded(child: NewsDetails(source: widget.sourcesList[selectedIndex]))
        ],
      ),
    );
  }
}
