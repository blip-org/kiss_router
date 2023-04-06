import 'package:flutter/material.dart';

@immutable
class KissRouteName {
  KissRouteName(this.value) : assert(_assertRoute(value));
  final String value;

  @override
  int get hashCode => 1;

  @override
  operator ==(other) {
    if (other is KissRouteName) return other.value == value;
    return false;
  }

  @override
  String toString() {
    return value;
  }

  /// checks if string begins with "/" and does not end with "/"
  static final regExp = RegExp(
    r'^(\/).*(?<!\/)$',
    caseSensitive: false,
    multiLine: false,
  );

  static bool _assertRoute(String routeName) {
    if (routeName == "/") {
      return true;
    }
    final match = regExp.firstMatch(routeName);

    if (match == null) return false;

    return true;
  }
}
