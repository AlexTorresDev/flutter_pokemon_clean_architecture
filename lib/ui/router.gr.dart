// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'pages/details/details_page.dart' as _i2;
import 'pages/home/home_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    DetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailsRouteArgs>(
          orElse: () => DetailsRouteArgs(id: pathParams.getString('id')));
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.DetailsPage(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i3.RouteConfig(
          DetailsRoute.name,
          path: '/details/:id',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.DetailsPage]
class DetailsRoute extends _i3.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i4.Key? key,
    required String id,
  }) : super(
          DetailsRoute.name,
          path: '/details/:id',
          args: DetailsRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
        );

  static const String name = 'DetailsRoute';
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.id,
  });

  final _i4.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, id: $id}';
  }
}
