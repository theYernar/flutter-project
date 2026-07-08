import 'dart:async';

extension DurationExtension on Duration {
  Future<T> delayed<T>([FutureOr<T> Function()? computation]) =>
      Future<T>.delayed(this, computation);

  Future<void> get sleep => delayed<void>();
}
