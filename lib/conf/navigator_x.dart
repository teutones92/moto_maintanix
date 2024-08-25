import 'package:flutter/material.dart';

class NavigatorX {
  static void push(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(opacity: animation, child: widget),
      ),
    );
  }

  static void pushNoFade(BuildContext context, Widget widget) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
