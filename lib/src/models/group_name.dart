part of kiss_router;

class GroupName {
  /// Unique identification name of current group.
  final String value;

  /// Enables/Disables automatically implements sub routes (if exists)
  /// of current route [value].
  ///
  /// If not set, continues as [false].
  /// FIXME: the actual job is not implemented.
  final bool includeSubRoutes;

  const GroupName(
    this.value, {
    this.includeSubRoutes = false,
  });
}
