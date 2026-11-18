.PHONY: clean generate format analyze l10n

# Очистка кэша, загрузка пакетов и установка подов для iOS
clean:
	flutter clean
	flutter pub get
	cd ios && pod install && cd ..

# Генерация кода (роуты, freezed, json_serializable и т.д.)
gen:
	dart run build_runner build --delete-conflicting-outputs

# Форматирование кода
format:
	dart format .

# Проверка линтером
analyze:
	flutter analyze

# Генерация локализаций (строки)
l10n:
	flutter gen-l10n

# Быстрый запуск всех проверок перед коммитом
check: format analyze

# Сборка Android APK (Release)
apk:
	flutter build apk --release 

# Сборка Android App Bundle (AAB для Google Play)
aab:
	flutter build appbundle --release

# Сборка iOS IPA (Release)
ipa:
	flutter build ipa --release

# Загрузка в TestFlight
testflight:
	flutter build ipa --release
	@APPLE_ID=$$(grep '^APPLE_ID=' apple_credentials.env | cut -d '=' -f2) && \
	APPLE_APP_SPECIFIC_PASSWORD=$$(grep '^APPLE_APP_SPECIFIC_PASSWORD=' apple_credentials.env | cut -d '=' -f2) && \
	xcrun altool --upload-app --type ios -f build/ios/ipa/*.ipa -u "$$APPLE_ID" -p "$$APPLE_APP_SPECIFIC_PASSWORD"
