import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project/src/core/utils/talker_logger_util.dart';

/// Forces the entire widget subtree to rebuild by changing a `UniqueKey`.
/// Useful after logout / locale change / theme reset.
class AppRestartBloc extends Bloc<AppRestartEvent, AppRestartState> {
  AppRestartBloc() : super(AppRestartStateLoaded(key: UniqueKey())) {
    on<AppRestartEventRestartApp>(_onRestart);
  }

  Key _key = UniqueKey();
  Key get uniqueKey => _key;

  Future<void> _onRestart(
    AppRestartEventRestartApp event,
    Emitter<AppRestartState> emit,
  ) async {
    try {
      emit(const AppRestartStateLoading());
      _key = UniqueKey();
      emit(AppRestartStateLoaded(key: _key));
    } catch (e, st) {
      TalkerLoggerUtil.talker.error('AppRestartBloc error: $e', st);
      emit(AppRestartStateError(message: e.toString()));
    }
  }
}

abstract class AppRestartEvent extends Equatable {
  const AppRestartEvent();

  @override
  List<Object?> get props => [];
}

final class AppRestartEventRestartApp extends AppRestartEvent {
  const AppRestartEventRestartApp();
}

abstract class AppRestartState extends Equatable {
  const AppRestartState();

  @override
  List<Object?> get props => [];
}

final class AppRestartStateLoading extends AppRestartState {
  const AppRestartStateLoading();
}

final class AppRestartStateLoaded extends AppRestartState {
  const AppRestartStateLoaded({required this.key});
  final Key key;

  @override
  List<Object?> get props => [key];
}

final class AppRestartStateError extends AppRestartState {
  const AppRestartStateError({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
