import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/Model/article_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsArticle extends StatefulWidget {
  final NewsApiModel model;
  const NewsArticle({Key? key,required this.model,}) : super(key: key);

  @override
  State<NewsArticle> createState() => _NewsArticleState();
}

class _NewsArticleState extends State<NewsArticle> {
  final Completer<WebViewController> _completer = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2C394B),
        appBar :AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF2C394B),
          elevation: 0,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(5),
                  color: const Color(0xFFFF4C29),
                  child: const Text(
                    'TECH',
                    style: TextStyle(color: Colors.white, backgroundColor: Color(0xFFFF4C29)),
                  )),
              const Text(' NEWS',
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: Container(
          child: WebView(

            initialUrl: widget.model.url,
            onWebViewCreated: ((WebViewController webviewcontroller){
                _completer.complete(webviewcontroller);
            }),
          ),
        )
    );
  }
}

