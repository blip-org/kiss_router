part of kiss_router;

class KissProvider extends ChangeNotifier {
  /// Defines the current index of the bottom navigation bar.
  /// Mostly used in the first Instantiation
  int currentIndex = 0;

  /// Is used to control the certain items show up while authenticated in
  /// bottom navigation bar.
  bool _authenticated = false;

  bool get isAuthenticated => _authenticated;

  /// change [authenticated]'s value
  void setAuthenticated(bool authVal) => _authenticated = authVal;
}

/// type of page that search would be performed on
enum PageType {
  upcoming,
  catchup,
  artist,
}
