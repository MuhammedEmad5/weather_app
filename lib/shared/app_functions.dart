

import 'package:flutter/material.dart';

class AppFunctions {

  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      BuildContext context, String content,
      {required bool error,int seconds=2}) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: Theme.of(context).disabledColor),
        ),
        duration: Duration(seconds: seconds),
        backgroundColor: error ? Colors.red : Colors.green,
      ),
    );
  }

}
