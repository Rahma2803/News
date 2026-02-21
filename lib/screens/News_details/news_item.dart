import 'package:flutter/material.dart';
import 'package:news/model/news.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/utitis/context_extentions.dart';
import 'package:news/widgets/loading.dart';
import 'package:timeago/timeago.dart' as timeago;



class NewsItem extends StatelessWidget {
  final News newItem ;
  Color bgColor;
  Color textColor;
  NewsItem({super.key, required this.newItem, required this.bgColor,required this.textColor});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    DateTime dateTime = DateTime.parse(newItem.publishedAt?? "");
    String timeAgo = timeago.format(dateTime); 
    return Container(
      margin: EdgeInsets.symmetric(horizontal:context.w*0.02 ,vertical: context.h*0.01),
      padding: EdgeInsets.symmetric(horizontal:context.w*0.02,vertical: context.h*0.01),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.theme.splashColor,
          width: 2
        )
      ),
      child: Column(
        spacing: context.h*0.02,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: CachedNetworkImage(
                imageUrl: newItem.urlToImage?? "",
                placeholder: (context, url) => Loading(),
                errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(newItem.title??"",style: textTheme.labelLarge?.copyWith(color: textColor),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("By : ${newItem.author ?? " "}", style: textTheme.labelSmall,),
              Text(timeAgo, style: textTheme.labelSmall,)
            ],
          )
        ],
      ),
    );
  }
}