import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/news.dart';
import 'package:news/model/sources.dart';
import 'package:news/providers/app_language_provider.dart';
import 'package:news/screens/News_details/news_item.dart';
import 'package:news/screens/article_web_view.dart';
import 'package:news/utitis/context_extentions.dart';
import 'package:news/widgets/loading.dart';
import 'package:provider/provider.dart';

class NewsDetails extends StatefulWidget {
  final Source? source;
  final String? searchQuery;
  const NewsDetails({super.key,this.source,this.searchQuery,});
  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  List<News> newsList = [];
  int page = 1;
  bool isLoading = false;
  bool hasMore = true;
  News? selectedNews;
  String? currentLanguage;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoading &&
          hasMore) {
        fetchNews();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final newLanguage =
        context.watch<AppLanguageProvider>().currentLanguage;

    if (currentLanguage != newLanguage) {
      currentLanguage = newLanguage;
      resetAndFetch();
    }
  }

  @override
  void didUpdateWidget(covariant NewsDetails oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.source?.id != widget.source?.id ||
        oldWidget.searchQuery != widget.searchQuery) {
      resetAndFetch();
    }
  }

  void resetAndFetch() {
    page = 1;
    newsList.clear();
    hasMore = true;
    selectedNews = null;
    fetchNews();
  }

  Future<void> fetchNews() async {
    if (isLoading) return;

    setState(() => isLoading = true);

    NewsResponse response;

    if (widget.searchQuery != null) {
      response = await ApiManager.searchNews(
        widget.searchQuery!,
        page: page,
        pageSize: 10,
        language: currentLanguage ?? "en",
      );
    } else {
      response = await ApiManager.getNews(
        widget.source!.id,
        page: page,
        pageSize: 10,
        language: currentLanguage ?? "en",
      );
    }

    if (!mounted) return;

    if (response.status == "ok") {
      final newArticles = response.articles ?? [];

      setState(() {
        page++;
        newsList.addAll(newArticles);
        isLoading = false;

        if (newArticles.length < 10) {
          hasMore = false;
        }
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {

    if (newsList.isEmpty && isLoading) {
      return const Loading();
    }

    if (newsList.isEmpty && !isLoading) {
      return Center(
        child: Text(
          "No results found",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );
    }

    return Stack(
      children: [

        ListView.builder(
          controller: _scrollController,
          itemCount: newsList.length + (hasMore ? 1 : 0),
          itemBuilder: (context, index) {

            if (index < newsList.length) {
              final news = newsList[index];

              return InkWell(
                onTap: () {
                  setState(() {
                    selectedNews = news;
                  });
                },
                child: NewsItem(
                  newItem: news,
                  bgColor: context.theme.splashColor,
                  textColor: context.theme.splashColor,
                ),
              );
            } else {
              return const Padding(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),

        if (selectedNews != null)
          Positioned.fill(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedNews = null;
                });
              },
              child: Container(
                color: Colors.black.withOpacity(0.6),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: context.h * 0.02,
                    ),
                    decoration: BoxDecoration(
                      color: context.theme.splashColor,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        NewsItem(
                          newItem: selectedNews!,
                          bgColor: context.theme.splashColor,
                          textColor: context.theme.primaryColor,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal:context.w*0.02,vertical: context.h*0.01),
                          child: SizedBox( 
                            width: double.infinity, 
                            height: context.h * 0.07, 
                            child: ElevatedButton( 
                              style: ElevatedButton.styleFrom( 
                                backgroundColor: context.theme.primaryColor, 
                                foregroundColor: context.theme.splashColor, 
                                shape: RoundedRectangleBorder( 
                                  borderRadius: BorderRadius.circular(12), 
                                ),
                              ), 
                              onPressed: () {
                                 final url = selectedNews?.url; 
                                 if (url != null && url.isNotEmpty) { 
                                  Navigator.push( context, MaterialPageRoute( builder: (_) => ArticleWebView( url: url, ), ), ); 
                                } 
                              }, 
                              child: const Text( "View Full Article", ), 
                            ), 
                          ),
                        ), 
                        SizedBox(height: context.h * 0.02),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
