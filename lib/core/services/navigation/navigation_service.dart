import 'package:flutter/material.dart';

/// A custom navigation service that provides navigation methods without requiring context.
/// Use this service for navigation throughout the app.
class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Gets the current navigator state
  NavigatorState? get _navigator => navigatorKey.currentState;

  /// Gets the current context
  BuildContext? get context => navigatorKey.currentContext;

  /// Push a new route onto the navigator
  Future<T?>? push<T extends Object?>(Route<T> route) {
    return _navigator?.push(route);
  }

  /// Push a new page using MaterialPageRoute
  Future<T?>? pushPage<T extends Object?>(Widget page) {
    return push(MaterialPageRoute<T>(builder: (_) => page));
  }

  /// Push a named route onto the navigator
  Future<T?>? pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return _navigator?.pushNamed(routeName, arguments: arguments);
  }

  /// Replace the current route with a new route
  Future<T?>? pushReplacement<T extends Object?, TO extends Object?>(
    Route<T> route, {
    TO? result,
  }) {
    return _navigator?.pushReplacement(route, result: result);
  }

  /// Replace the current route with a new page using MaterialPageRoute
  Future<T?>? pushReplacementPage<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) {
    return pushReplacement(
      MaterialPageRoute<T>(builder: (_) => page),
      result: result,
    );
  }

  /// Replace the current route with a named route
  Future<T?>? pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return _navigator?.pushReplacementNamed(
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Push a route and remove all previous routes
  Future<T?>? pushAndRemoveUntil<T extends Object?>(
    Route<T> route,
    bool Function(Route<dynamic>) predicate,
  ) {
    return _navigator?.pushAndRemoveUntil(route, predicate);
  }

  /// Push a page and remove all previous routes using MaterialPageRoute
  Future<T?>? pushPageAndRemoveUntil<T extends Object?>(
    Widget page,
    bool Function(Route<dynamic>) predicate,
  ) {
    return pushAndRemoveUntil(
      MaterialPageRoute<T>(builder: (_) => page),
      predicate,
    );
  }

  /// Push a named route and remove all previous routes
  Future<T?>? pushNamedAndRemoveUntil<T extends Object?>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) {
    return _navigator?.pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  /// Pop the current route off the navigator
  void pop<T extends Object?>([T? result]) {
    _navigator?.pop(result);
  }

  /// Pop routes until the predicate returns true
  void popUntil(bool Function(Route<dynamic>) predicate) {
    _navigator?.popUntil(predicate);
  }

  /// Check if we can pop the current route
  bool canPop() {
    return _navigator?.canPop() ?? false;
  }

  /// Pop the current route if possible
  void maybePop<T extends Object?>([T? result]) {
    if (canPop()) {
      pop(result);
    }
  }
}
