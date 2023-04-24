import 'package:flutter/material.dart';

class GroupModel {
  /// A non-nullable list of route names.
  ///
  /// These routes will be wrapped with a top-level
  /// widget/route by provided [builder].
  final List<String> routes;

  /// A unique identification string for current [GroupModel].
  ///
  /// If not set, [GroupModel] will be only used as wrapper/(on top builder)
  /// for provided [routes] names.
  final String? flowID;

  /// A top-level wrapper builder for provided [routes].
  final Widget Function(BuildContext context)? builder;

  const GroupModel({
    required this.routes,
    this.flowID,
    this.builder,
  });
}
