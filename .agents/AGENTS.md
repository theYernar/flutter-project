# Project-Scoped Rules: GT Oil Flutter

This file contains the consolidated coding style and architectural rules derived from the project's `.agents/skills/feature` instructions and existing codebase. All future feature implementations and code edits should adhere to these guidelines.

## 1. Feature Architecture & Folder Structure
Features are located under `lib/src/feature/<feature_name>`. 
Each feature should stick to a separation of concerns using the following standardized sub-directories (avoid older names like `ui`, `models`, or `cubit` for new features):
- **`bloc/`**: Contains Bloc/Cubit state managers.
- **`data/`**: Contains repositories and remote data sources.
- **`model/`**: Contains DTOs and feature-specific models.
- **`ui/`**: 
  - `pages/` for route-level screens.
  - `widgets/` for extracted reusable feature-specific UI parts.

## 2. Data Layer Style
The data layer relies strictly on interfaces and Dependency Injection.
- **Interfaces**: Always define `abstract interface class I...` for Repositories and Data Sources.
- **Implementations**: Use `final class ... implements I...` with required named parameters in constructors for dependencies (e.g., `IRestClient`, `IAuthRemoteDataSource`).
- **Data Flow**: Transport parsing (from JSON) stays in Remote Data Sources; mapping/orchestration happens in Repositories.
- **Dependency Registration**: App-level repositories must be registered in `lib/src/core/containers/repository_storage.dart` with lazy initialization (`??=`) and proper disposal in `close()`. Use `context.repository.<featureRepository>` to access them from the UI.

## 3. State Management (Bloc / Cubit)
- **Folder**: Always place state managers in the `bloc/` folder, even if using Cubit.
- **States & Events**: Use union states for mutually exclusive flows (e.g., loading, loaded, failure). You can use `freezed` by default, or Dart 3 `sealed class` combined with `Equatable`.
- **Naming & Content**: 
  - Use `failure` for UI error states (e.g., `AppState.failure(message: ...)`).
  - Use domain-specific events (`AppLoggedOut`), not generic ones (`ChangeState`).
- **Async Safety**: When awaiting async tasks inside a Cubit/Bloc, guard later emissions with a check to see if the state manager is closed (`if (isClosed) return;`).

## 4. Presentation & UI Guidelines
- **Routing**: Use `auto_route`. Decorate pages with `@RoutePage()`, register them in `lib/src/feature/app/router/app_router.dart`, and run `build_runner` to generate routes. Never edit `app_router.gr.dart` manually.
- **Localization**: Do not hardcode user-facing strings. Add strings to ARB files (`lib/src/core/constant/localization/translations`) and generate with `flutter gen-l10n`. Access them via `context.localized`.
- **Assets**: Use generated asset classes (`Assets.icons...` from `assets.gen.dart`); do not use string paths.
- **Theming & Components**: Prefer reusable core UI. Use colors/styles from `AppColors`, `AppTextStyles`, spacing like `Gap(AppGaps.sm)`. Re-use widgets from `lib/src/core/presentation/widgets/`.

## 5. Verification & Code Quality
Before completing any Dart/Flutter feature code, always format and lint:
```sh
dart format .
flutter analyze
```
Run generation commands when necessary:
```sh
flutter gen-l10n
dart run build_runner build --delete-conflicting-outputs
```
Do not include unrelated refactors in feature work.
