import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/cateogory.dart';
import 'package:news/model/sources.dart';
import 'package:news/screens/category_details/sources/source_widget.dart';
import 'package:news/widgets/loading.dart';
import 'package:news/widgets/error.dart';

class CategoryDetails extends StatefulWidget {
  final Category category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {


  @override
  Widget build(BuildContext context) {
        var textTheme = Theme.of(context).textTheme;

    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(widget.category.id),
      builder: (context, snapshot) {

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loading();
        }
        if (snapshot.hasError) {
          return ErrorCustom(
              message: "Something went wrong",
              buttonText: "Try Again",
              onPressed:(){
                ApiManager.getSources(widget.category.id);
                setState(() {
                  
                });
              },
          );
        }
        if (snapshot.data?.status != "ok") {
          return Center(
            child: ErrorCustom(
              message: snapshot.data?.message ?? "Server Error",
              buttonText: "Try Again",
              onPressed:(){
                ApiManager.getSources(widget.category.id);
                setState(() {
                  
                });
              },
            ),
          );
        }

        var sourcesList = snapshot.data?.sources ?? [];
          return SourceWidget(sourcesList: sourcesList);
        
      },
    );
  }
}
