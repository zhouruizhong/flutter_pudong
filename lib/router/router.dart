import 'package:auto_route/auto_route.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pudong/core/widget/web_view_page.dart';
import 'package:flutter_pudong/router/route_map.gr.dart';

///使用fluro进行路由管理
class XRouter {
  static FluroRouter router;

  static void init() {
    router = FluroRouter();
    configureRoutes(router);
  }

  ///路由配置
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("route is not find !");
      return null;
    });

    //网页加载
    router.define('/web', handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      String title = params['title']?.first;
      String url = params['url']?.first;
      return WebViewPage(url, title);
    }));
  }

  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<RouterMap>();
}
