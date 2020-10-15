import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class GameplayWebview extends StatelessWidget {
  const GameplayWebview(this.url, {Key key}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (controller) {
      },
      onPageFinished: (_) {},
    );
  }
}
