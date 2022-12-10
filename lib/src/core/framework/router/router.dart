import 'package:auto_route/auto_route.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/details/details_page.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/error/error_page.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/home/home_page.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/login/login_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/login',
      page: LoginPage,
      initial: true,
    ),
    AutoRoute(
      path: '/',
      page: HomePage,
    ),
    AutoRoute(
      path: '/details/:id',
      page: DetailsPage,
    ),
    AutoRoute(
      path: '*',
      page: ErrorPage,
    ),
  ],
)
class $AppRouter {}