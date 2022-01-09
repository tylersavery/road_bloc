import 'package:flutter/material.dart';
import 'package:road_bloc/src/app.dart';

class Toast {
  static message(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }

  static error([String message = "A problem occurred."]) {
    final context = navigatorKey.currentContext!;

    final snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.error,
    );
    rootScaffoldMessengerKey.currentState?.showSnackBar(snackBar);
  }
}
