---
name: cubit-instruction
description: Create, update, or review Cubit state management classes in the project. Use when the user asks to create a Cubit, add a bloc/cubit to a feature, manage state, or use freezed for states.
---

# Cubit Instruction

Use this skill when working with Cubits for state management in the project.

## Project Contract

- Put feature-specific Cubits in `lib/src/feature/<feature_name>/cubit`.
- Name files `*_cubit.dart` and classes `*Cubit`.
- Use `freezed` for Cubit states, so that states can be easily pattern matched.
- State classes should be named `*State` and use union types for standard control flows (e.g., `initial`, `loading`, `success`, `error`).
- Pass dependencies (such as Repositories) through the constructor.
- Do not edit generated `*.freezed.dart` files by hand.

## File Pattern

Use this exact pattern for new Cubit files, ensuring the state is managed via Freezed:

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:golub/src/feature/auth/data/auth_repository.dart';
import 'package:golub/src/feature/auth/models/request/user_payload.dart';
import 'package:golub/src/feature/auth/models/response/user_dto.dart';

part 'login_cubit.freezed.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const LoginState.initial());

  final IAuthRepository _authRepository;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(const LoginState.loading());
    try {
      final payload = UserPayload(
        username: username,
        password: password,
      );
      final result = await _authRepository.login(payload: payload);
      emit(LoginState.success(authDTO: result));
    } catch (e) {
      emit(LoginState.error(message: e.toString()));
    }
  }
}

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.success({required AuthDTO authDTO}) = _Success;
  const factory LoginState.error({required String message}) = _Error;
}
```

## Behavior Boundary

- Cubits should orchestrate business logic and communicate with Repositories.
- Cubits should not depend on UI libraries (e.g. `package:flutter/material.dart`) or handle UI context, formatting, or routing directly.
- Wrap asynchronous repository operations in `try/catch` blocks and emit appropriate `error` states if they fail.

## Generation And Verification

After creating or changing Cubit files that use `@freezed` states, you must run the build runner to generate the `.freezed.dart` files:

```sh
dart run build_runner build --delete-conflicting-outputs
```

Then run the normal Dart/Flutter checks to ensure your changes are correct:

```sh
dart format .
flutter analyze
flutter test
```
