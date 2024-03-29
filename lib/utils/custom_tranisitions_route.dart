import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

CustomRoute scaleTransitionCustomRoute({
  required PageInfo page,
  String? path,
  Map<String, dynamic>? meta,
  bool initial = false,
}) =>
    CustomRoute(
      barrierDismissible: false,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          ScaleTransition(
        scale: animation,
        child: child,
      ),
      page: page,
      initial: initial,
      path: path,
      meta: meta ?? {},
    );

CustomRoute fadeTransitionCustomRoute({
  required PageInfo page,
  String? path,
  Map<String, dynamic>? meta,
  bool initial = false,
}) =>
    CustomRoute(
      barrierDismissible: false,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
      page: page,
      initial: initial,
      path: path,
      meta: meta ?? {},
    );

CustomRoute slideTransitionCustomRoute({
  required PageInfo page,
  String? path,
  Map<String, dynamic>? meta,
  bool initial = false,
}) =>
    CustomRoute(
      barrierDismissible: false,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          SlideTransition(
        position: animation.drive(
          Tween(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(
              curve: Curves.easeInOut,
            ),
          ),
        ),
        child: child,
      ),
      page: page,
      initial: initial,
      path: path,
      meta: meta ?? {},
    );
