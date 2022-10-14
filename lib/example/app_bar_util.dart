import 'package:flutter/material.dart';

class AppBarUtil {
  static PreferredSizeWidget noAppBar() {
    return PreferredSize(
      preferredSize: const Size(0, 0),
      child: Container(
        color: Colors.transparent,
        height: 0,
        width: 0,
      ),
    );
  }

  static AppBar emptyAppBar({Color? color}) {
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }

  static AppBar appBar({Color? color}) {
    return AppBar(
      backgroundColor: color ?? Colors.transparent,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      title: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: RotatedBox(
              quarterTurns: 2,
              child: Builder(
                builder: (context) => TextButton(
                  onPressed: () {},
                  child: Text('Hey there'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
