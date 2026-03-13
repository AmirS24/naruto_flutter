import 'package:auto_route/auto_route.dart';
import 'package:naruto_flutter/screen/naruto_detail_screen.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter{
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: NarutoRoute.page ,  initial: true),
    AutoRoute(page: NarutoDetailRoute.page)
  ];
}