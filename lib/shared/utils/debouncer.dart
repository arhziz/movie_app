import 'dart:async';
import 'dart:ui';

/// A simple debouncer class that can be used to limit the rate at
/// which a function can be called.
class Debouncer {
  /// Creates a [Debouncer] with the given [milliseconds] delay.
  Debouncer({this.milliseconds = 500});

  /// Creates a [Debouncer] with the given [milliseconds] delay.
  final int milliseconds;

  /// The action that will be executed after the delay.
  VoidCallback? action;

  /// The timer that will be used to delay the execution of the action.
  Timer? _timer;

  /// Cancels the current timer and starts a new one with the given [action].
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Cancels the current timer.
  /// This method is used to cancel the timer when the debouncer is no longer
  /// needed.
  void dispose() {
    _timer?.cancel();
  }
}
