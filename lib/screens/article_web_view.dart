import 'package:flutter/material.dart';
import 'package:news/utitis/context_extentions.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  final String url;

  const ArticleWebView({super.key, required this.url});

  @override
  State<ArticleWebView> createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  late final WebViewController controller;

  @override
void initState() {
  super.initState();

  final uri = Uri.tryParse(widget.url);

  controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);

  if (uri != null && uri.hasScheme) {
    controller.loadRequest(uri);
  }
}

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Article",style: textTheme.headlineLarge,),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: context.theme.splashColor,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
