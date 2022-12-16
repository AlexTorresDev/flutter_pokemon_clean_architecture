import 'package:go_router/go_router.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/details/details_page.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/error/error_page.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/home/home_page.dart';
import 'package:flutter_pokemon_clean_architecture/src/presentation/pages/login/login_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(
      path: '/login',
      builder: (_, state) => LoginPage(),
    ),
    GoRoute(
      path: '/',
      builder: (_, state) => const HomePage(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (_, state) => DetailsPage(id: state.params['id']!),
    ),
  ],
  errorBuilder: (_, state) => const ErrorPage(),
);
