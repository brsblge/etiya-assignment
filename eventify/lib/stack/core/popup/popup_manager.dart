import 'package:flutter/material.dart';

/// A tool to show/hide pre-defined or custom popups.
abstract class PopupManager {
  Future<void> showPopup(
    BuildContext context,
    Widget content, {
    Alignment alignment,
    EdgeInsets padding,
    Color? barrierColor,
    bool preventClose,
    bool preventBackPress,
  });

  Future<void> showFullScreenPopup(
    BuildContext context,
    Widget content, {
    bool preventBackPress,
  });
}

class PopupManagerImpl implements PopupManager {
  @override
  Future<void> showPopup(
    BuildContext context,
    Widget content, {
    Alignment alignment = Alignment.center,
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 20,
    ),
    Color? barrierColor,
    bool preventClose = false,
    bool preventBackPress = false,
  }) {
    return _showGeneralDialog(
      context,
      content,
      alignment: alignment,
      padding: padding,
      preventClose: preventClose,
      preventBackPress: preventBackPress,
      barrierColor: barrierColor,
      showFullScreen: false,
    );
  }

  @override
  Future<void> showFullScreenPopup(
    BuildContext context,
    Widget content, {
    bool preventBackPress = false,
  }) {
    return _showGeneralDialog(
      context,
      content,
      preventBackPress: preventBackPress,
      showFullScreen: true,
      enableSlideAnimation: true,
    );
  }

  // Helpers
  Future<void> _showGeneralDialog(
    BuildContext context,
    Widget content, {
    Alignment? alignment,
    EdgeInsets? padding,
    bool? preventClose,
    Color? barrierColor,
    required bool preventBackPress,
    required bool showFullScreen,
    bool enableSlideAnimation = false,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: preventClose != null ? !preventClose : true,
      barrierLabel: MaterialLocalizations.of(
        context,
      ).modalBarrierDismissLabel,
      barrierColor: barrierColor ?? Colors.black26,
      transitionBuilder: enableSlideAnimation
          ? (_, anim1, __, child) {
              return SlideTransition(
                position: Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(anim1),
                child: child,
              );
            }
          : null,
      pageBuilder: (_, __, ___) {
        return SafeArea(
          left: !showFullScreen,
          top: !showFullScreen,
          right: !showFullScreen,
          bottom: !showFullScreen,
          child: WillPopScope(
            onWillPop: () async => !preventBackPress,
            child: Align(
              alignment: alignment ?? Alignment.center,
              child: Padding(
                padding: showFullScreen
                    ? EdgeInsets.zero
                    : padding ?? EdgeInsets.zero,
                child: content,
              ),
            ),
          ),
        );
      },
    );
  }
  // - Helpers
}
