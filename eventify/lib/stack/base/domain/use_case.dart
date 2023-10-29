import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../core/logging/logger.dart';

/// Base class for standard use cases.
///
/// Every standard use case should extend this class.
///
/// If any of [TInput], [TOutput] or [TEvent] is not needed,
/// void can be passed as a generic type to be ignored.
///
/// Example usage:
///
/// ```dart
/// class Foo extends UseCase<void, bool, bool> {
///   Foo(super.logger);
///
///   @override
///   Future<bool> call({void params}) async {
///     ...
///     publish(true);
///     ...
///     publish(false);
///     ...
///     return true;
///   }
/// }
///
/// // Instantiate use case.
/// final foo = Foo(logger)..onEvent.listen((event) {
///   // Do whatever with the event.
/// });
///
/// // Execute use case.
/// await foo(); or await foo.call();
/// ```
///
/// See also:
///
/// * [StreamUseCase], a base for stream use cases.
abstract class UseCase<TInput, TOutput, TEvent> extends _UseCaseBase<TEvent> {
  UseCase(super.logger);

  /// Executes use case with the given [params] and
  /// returns a FutureOr of a [TOutput] instance.
  FutureOr<TOutput?> call({TInput? params});
}

/// Base class for stream use cases.
///
/// Every stream use case should extend this class.
///
/// If any of [TInput], [TOutput] or [TEvent] is not needed,
/// void can be passed as a generic type to be ignored.
///
/// Example usage:
///
/// ```dart
/// class Foo extends StreamUseCase<void, bool, bool> {
///   Foo(super.logger);
///
///   @override
///   Stream<bool> call({void params}) async* {
///     ...
///     publish(true);
///     ...
///     publish(false);
///     ...
///     while (true) {
///       yield true;
///     }
///   }
/// }
///
/// // Instantiate use case.
/// final foo = Foo(logger)..onEvent.listen((event) {
///   // Do whatever with the event.
/// });
///
/// // Execute use case.
/// final stream = await foo(); or await foo.call();
///
/// // Then evaluate stream values asynchronously.
/// stream.listen((value) {
///   // Do whatever with the value.
/// });
///
/// // Or synchronously.
/// await for (final value in stream) {
///   // Do whatever with the value.
/// }
/// ```
///
/// See also:
///
/// * [UseCase], a base for standard use cases.
abstract class StreamUseCase<TInput, TOutput, TEvent>
    extends _UseCaseBase<TEvent> {
  StreamUseCase(super.logger);

  /// Executes use case with the given [params] and
  /// returns a Stream of [TOutput] instances.
  Stream<TOutput?> call({TInput? params});
}

/// Private base class for use cases.
abstract class _UseCaseBase<TEvent> {
  _UseCaseBase(this.logger);

  final Logger logger;

  final _eventController = StreamController<TEvent>();

  /// Receives events of type [TEvent] to inform receiver
  /// when an intermediary update occurs during use case execution.
  Stream<TEvent> get onEvent => _eventController.stream;

  /// Publishes the given [event] to the subscribers of [onEvent].
  @protected
  void publish(TEvent event) {
    if (_eventController.hasListener) _eventController.add(event);
  }

  /// Useful to be overriden to stop a long running execution.
  @mustCallSuper
  Future<void> stop() async {
    await _eventController.close();
  }
}
