import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../stack/core/popup/popup_manager.dart';
import '../ui/custom/widgets/progress_spinner.dart';

extension PopupManagerExt on PopupManager {
  void showProgress(BuildContext context) {
    showPopup(
      context,
      const ProgressSpinner(),
      padding: EdgeInsets.zero,
      preventClose: true,
      preventBackPress: true,
    );
  }

  void hideProgress(BuildContext context) {
    Navigator.of(context).pop();
  }

  Future<T> runInProgress<T>(
    BuildContext context,
    Future<T> task, {
    FutureOr<void> Function(T result)? then,
  }) async {
    showProgress(context);
    final taskResult = await task;
    if (context.mounted) hideProgress(context);
    await then?.call(taskResult);
    return taskResult;
  }
}
