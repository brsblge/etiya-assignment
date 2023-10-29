// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:visibility_aware_state/visibility_aware_state.dart';

import '../../core/ioc/service_locator.dart';
import 'controller.dart';
import 'controller_provider.dart';

/// Base class for pages/sub-pages.
///
/// Every page/sub-page should extend this class as an example as below.
///
/// ```dart
/// class FooPage extends ControlledView<FooController> {
///   FooPage({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return Scaffold(
///       body: Container(),
///       floatingActionButton: FloatingActionButton(
///         onPressed: () {
///           // Use controller to trigger events.
///           controller.doSomething();
///         },
///       ),
///     );
///   }
/// }
///
/// class FooController extends Controller {
///   FooController({required super.logger});
///
///   void doSomething() {
///     // Do something.
///   }
/// }
/// ```
///
/// See also:
///
/// * [Controller], a base to components that hold presentation logic.
abstract class ControlledView<TController extends Controller>
    extends StatefulWidget {
  ControlledView({
    super.key,
    required this.params,
  }) : controller = locator<TController>();

  /// Optional parameters that can be passed during navigation.
  final Object? params;

  /// Controller of this view. It is to be used as a presentation logic holder.
  late final TController controller;

  /// Called when the view is activated on start or resume.
  @protected
  @mustCallSuper
  void onActivate() {}

  /// Called once when the view is initialized.
  @protected
  @mustCallSuper
  void onStart() {}

  /// Called once when the view started and whenever the dependencies change.
  @protected
  @mustCallSuper
  void onPostStart() {}

  /// Called after build is finished.
  @protected
  @mustCallSuper
  void onPostBuild() {}

  /// Called when the view is visible back from pause.
  @protected
  @mustCallSuper
  void onResume() {}

  /// Called when the view is visible on screen.
  @protected
  @mustCallSuper
  void onVisible() {}

  /// Called when the view is hidden on screen.
  @protected
  @mustCallSuper
  void onHidden() {}

  /// Called when the view goes invisible and running in the background.
  @protected
  @mustCallSuper
  void onPause() {}

  /// Called when the view is disposed. The difference between onStop and
  /// onClose is that onClose is called when the app is detached but
  /// onStop means the view is popped from the navigation stack.
  @protected
  @mustCallSuper
  void onStop() {}

  /// Called when the app is detached which usually happens when
  /// back button is pressed.
  @protected
  @mustCallSuper
  void onClose() {}

  /// Called when the view is deactivated on pause or close.
  @protected
  @mustCallSuper
  void onDeactivate() {}

  /// Called when back button is pressed.
  @protected
  @mustCallSuper
  Future<bool> onBackRequest() => Future.value(true);

  @override
  // ignore: library_private_types_in_public_api
  _ControlledViewState<TController> createState() {
    // Create the view state with all the callbacks.
    // ignore: no_logic_in_create_state
    return _ControlledViewState(
      controller,
      buildView: (context) {
        return ControllerProvider(
          controller: controller,
          child: WillPopScope(
            // Handle back press.
            onWillPop: () async {
              if (!controller.isActive) return Future.value(false);
              return await onBackRequest() == await controller.onBackRequest();
            },
            child: build(context),
          ),
        );
      },
      onActivate: onActivate,
      onInitState: onStart,
      onPostInitState: onPostStart,
      onPostBuild: onPostBuild,
      onResume: onResume,
      onVisible: onVisible,
      onHidden: onHidden,
      onPause: onPause,
      onDispose: onStop,
      onDetach: onClose,
      onDeactivate: onDeactivate,
    );
  }

  /// Describes the widget to be constructed.
  @protected
  Widget build(BuildContext context);
}

// View state that handles all the lifecycle events.
class _ControlledViewState<TController extends Controller>
    extends VisibilityAwareState<ControlledView>
    with
        WidgetsBindingObserver,
        TickerProviderStateMixin,
        AutomaticKeepAliveClientMixin {
  _ControlledViewState(
    this._controller, {
    required this.buildView,
    required this.onActivate,
    required this.onInitState,
    required this.onPostInitState,
    required this.onPostBuild,
    required this.onResume,
    required this.onVisible,
    required this.onHidden,
    required this.onPause,
    required this.onDispose,
    required this.onDetach,
    required this.onDeactivate,
  });

  final Controller _controller;
  final Widget Function(BuildContext context) buildView;
  final VoidCallback onActivate;
  final VoidCallback onInitState;
  final VoidCallback onPostInitState;
  final VoidCallback onPostBuild;
  final VoidCallback onResume;
  final VoidCallback onVisible;
  final VoidCallback onHidden;
  final VoidCallback onPause;
  final VoidCallback onDispose;
  final VoidCallback onDetach;
  final VoidCallback onDeactivate;

  @override
  bool get wantKeepAlive => _controller.keepViewAlive;

  @override
  void initState() {
    super.initState();
    // Share BuildContext with the controller.
    _controller.context = context;
    // Pass optional params to the controller.
    _controller.params = widget.params;
    // Set ticker provider for the controller.
    _controller.vsync = this;
    onActivate();
    _controller.onActivate();
    onInitState();
    _controller.onStart();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onPostBuild();
      _controller.onReady();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    onPostInitState();
    _controller.onPostStart();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.inactive:
        onDeactivate();
        _controller.onDeactivate();
        break;
      case AppLifecycleState.resumed:
        onActivate();
        _controller.onActivate();
        onResume();
        _controller.onResume();
        break;
      case AppLifecycleState.paused:
        onPause();
        _controller.onPause();
        break;
      case AppLifecycleState.detached:
        onDetach();
        _controller.onClose();
        break;
      default:
        break;
    }
  }

  @override
  void onVisibilityChanged(WidgetVisibility visibility) {
    switch (visibility) {
      case WidgetVisibility.VISIBLE:
        onVisible();
        _controller.onVisible();
        break;
      case WidgetVisibility.INVISIBLE:
      case WidgetVisibility.GONE:
        onHidden();
        _controller.onHidden();
        break;
    }
    super.onVisibilityChanged(visibility);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildView(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _controller.onStop();
    onDispose();
    super.dispose();
  }
}
