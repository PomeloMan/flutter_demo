import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/app/index.dart';
import 'package:flutter_demo/model/account.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print('build: MyApp');

    // 设置状态栏沉浸式
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //设置为透明
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MultiProvider(
      providers: [
        Provider<Account>(create: (_) => Account()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.indigo,
            accentColor: Colors.indigoAccent,
            errorColor: Colors.red[700],
            hintColor: Colors.blue[700],
            backgroundColor: Colors.white),
        home: AppPage(), // becomes the route named '/'
        /// 命名路由
        // initialRoute: '/',
        // routes: {
        //   '/': (context) => AppPage(), // Navigator.pushNamed(context, '/');
        //   '/todo': (context) => TodoPage(), // Navigator.pushNamed(context, '/todo');
        // },
      ),
    );
  }
}

/// 路由动画
/// 从右向左滑动进入
class CustomRouteSlide extends PageRouteBuilder {
  final Widget widget;

  CustomRouteSlide(
    this.widget,
  ) : super(
            // 设置过度时间
            transitionDuration: Duration(milliseconds: 300),
            // 构造器
            pageBuilder: (
              BuildContext context,
              Animation<double> animaton1,
              Animation<double> animaton2,
            ) {
              return widget;
            },
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animaton1,
              Animation<double> animaton2,
              Widget child,
            ) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(1.0, 0.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animaton1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            });
}
