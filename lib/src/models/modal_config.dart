// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kiss_router/src/kiss_router.dart';

import '../enums/modal_type.dart';

/// [ModalConfig] allows configuring modal bottom sheet routes.
class ModalConfig {
  /// Tell the [KissRouter] if the modal window can be dismissed
  final bool isDismissible;

  /// background color of the modal window, can be overridden if you define
  /// the [Scaffold] with `backgroundColor` inside of a screen object.
  ///
  /// i.e:
  /// ```dart
  /// class ProfileScreen extends StatelessWidget {
  ///
  ///   Widget build(BuildContext context) {
  ///     return Scaffold(
  ///       backgroundColor: Colors.red,
  ///     )
  ///   }
  /// }
  /// ```
  final Color barrierColor;

  /// Define if you want to stretch the modal with full height of the screen;
  final bool expanded;

  /// You can, what type of the modal do you want to have.
  /// [KissRouter] automatically detects platform and chooses which type of a
  /// modal it should show, but in case you want to show either android or
  /// cupertino modal for every platform you specifically define it.
  ///
  /// For available types see the [ModalType]
  final ModalType? modalType;

  /// Enable drag for the modal window, mostly for closing purposes.
  final bool enableDrag;

  /// The bounce parameter specifies if the bottom sheet can go beyond the
  /// top boundary while dragging
  final bool bounce;

  ModalConfig({
    this.isDismissible = true,
    this.barrierColor = Colors.transparent,
    this.expanded = true,
    this.modalType,
    this.enableDrag = false,
    this.bounce = false,
  });
}
