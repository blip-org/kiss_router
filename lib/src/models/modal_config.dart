// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ModalConfig {
  final bool isDismissible;
  final Color modalBarrierColor;
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
