import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/src/core/utils/extensions/duration_extension.dart';

mixin StateNotifierMixin<State extends Object> on BlocBase<State> {
  Future<void> notify(
    State stateToNotify, {
    Duration notifyDelay = Duration.zero,
    State? then,
  }) async {
    final stateToRestore = then ?? state;
    emit(stateToNotify);
    await notifyDelay.sleep;
    emit(stateToRestore);
  }
}
