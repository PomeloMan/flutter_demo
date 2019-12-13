import 'package:flutter/material.dart';
import 'package:flutter_demo/page/signin/index.dart';

class AppPage extends StatefulWidget {
  AppPage({Key key}) : super(key: key);

  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return SigninPage();
  }
}
