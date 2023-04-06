// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

/// [ModalConfig] allows configuring modal bottom sheet routes.

class ModalConfig {
  /// Tell the kiss_router if the modal window can be dismissed
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
  final Color modalBarrierColor;

  /// Define if you want to stretch the modal with full height of the screen;
  final bool expanded;
  final bool enableDrag;
  final bool bounce;

  ModalConfig({
    this.isDismissible = true,
    this.modalBarrierColor = Colors.transparent,
    this.expanded = true,
    this.enableDrag = false,
    this.bounce = false,
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
