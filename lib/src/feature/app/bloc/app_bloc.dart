import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_project/src/core/utils/talker_logger_util.dart';
import 'package:flutter_project/src/feature/auth/data/auth_repository.dart';

final class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this._authRepository}) : super(const AppState.loading()) {
    _sessionExpiredSubscription = _authRepository.sessionExpired.listen((_) {
      add(const AppEvent.sessionExpired());
    });

    on<AppStarted>(_onStarted);
    on<AppLoggedOut>(_onLoggedOut);
    on<AppSessionExpired>(_onSessionExpired);
  }

  final IAuthRepository _authRepository;
  late final StreamSubscription<void> _sessionExpiredSubscription;

  Future<void> _onStarted(AppStarted event, Emitter<AppState> emit) async {
    try {
      _emitLoadingIfNeeded(emit);
      emit(
        _authRepository.isAuthenticated
            ? const AppState.authenticated()
            : const AppState.unauthenticated(),
      );
    } catch (error, st) {
      TalkerLoggerUtil.talker.error('AppBloc started error: $error', error, st);
      emit(AppState.failure(message: error.toString()));
    }
  }

  Future<void> _onLoggedOut(AppLoggedOut event, Emitter<AppState> emit) async {
    await _clearSession(emit);
  }

  Future<void> _onSessionExpired(
    AppSessionExpired event,
    Emitter<AppState> emit,
  ) async {
    await _clearSession(emit);
  }

  Future<void> _clearSession(Emitter<AppState> emit) async {
    try {
      _emitLoadingIfNeeded(emit);
      await _authRepository.logout();
      emit(const AppState.unauthenticated());
    } catch (error, st) {
      TalkerLoggerUtil.talker.error('AppBloc logout error: $error', error, st);
      emit(AppState.failure(message: error.toString()));
    }
  }

  void _emitLoadingIfNeeded(Emitter<AppState> emit) {
    if (state is! AppLoading) {
      emit(const AppState.loading());
    }
  }

  @override
  Future<void> close() async {
    await _sessionExpiredSubscription.cancel();
    return super.close();
  }
}

sealed class AppEvent extends Equatable {
  const AppEvent();

  const factory AppEvent.started() = AppStarted;

  const factory AppEvent.loggedOut() = AppLoggedOut;

  const factory AppEvent.sessionExpired() = AppSessionExpired;

  @override
  List<Object?> get props => [];
}

final class AppStarted extends AppEvent {
  const AppStarted();
}

final class AppLoggedOut extends AppEvent {
  const AppLoggedOut();
}

final class AppSessionExpired extends AppEvent {
  const AppSessionExpired();
}

sealed class AppState extends Equatable {
  const AppState();

  const factory AppState.loading() = AppLoading;

  const factory AppState.authenticated() = AppAuthenticated;

  const factory AppState.unauthenticated() = AppUnauthenticated;

  const factory AppState.failure({required String message}) = AppFailure;

  @override
  List<Object?> get props => [];
}

final class AppLoading extends AppState {
  const AppLoading();
}

final class AppAuthenticated extends AppState {
  const AppAuthenticated();
}

final class AppUnauthenticated extends AppState {
  const AppUnauthenticated();
}

final class AppFailure extends AppState {
  const AppFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
