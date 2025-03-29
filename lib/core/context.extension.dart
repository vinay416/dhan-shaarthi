import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void pushAndClearStack(String name, {Object? arguments}) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      name,
      ModalRoute.withName("/"),
      arguments: arguments,
    );
  }

  void pushAndReplace(String name, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(name, arguments: arguments);
  }

  void push(String route, {Object? arguments}) {
    Navigator.of(this).pushNamed(route, arguments: arguments);
  }

  void pop() {
    Navigator.of(this).pop();
  }
}
