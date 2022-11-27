import 'package:auto_route/auto_route.dart';
import 'package:flutter_pokemon_clean_architecture/ui/pages/details/details_page.dart';
import 'package:flutter_pokemon_clean_architecture/ui/pages/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: HomePage,
      initial: true,
    ),
    AutoRoute(
      path: '/details/:name',
      page: DetailsPage,
    ),
    /*AutoRoute(
      path: '*',
      page: ErrorPage,
      name: 'ErrorRoute',
    ),*/
  ],
)
class $AppRouter {}
