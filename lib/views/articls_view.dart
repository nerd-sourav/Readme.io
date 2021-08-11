import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class ArticleView extends StatefulWidget {
  final String blogUrl;
  final String blogTitle;

  ArticleView({@required this.blogUrl, @required this.blogTitle});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebView(
        initialUrl: widget.blogUrl,
        onWebViewCreated: (WebViewController webViewController) {
          _controller.complete(
            webViewController,
          );
        },
      ),
    ));
  }
}
