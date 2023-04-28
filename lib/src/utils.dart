extension KissRouteName on String {
  /// Checks if string begins with "/" and does not end with "/"
  static final validRoute = RegExp(
    r'^(\/).*(?<!\/)$',
    caseSensitive: false,
    multiLine: false,
  );

  bool get isInvalid {
    if (validRoute.firstMatch(this) == null) return false;
    return true;
  }
}
