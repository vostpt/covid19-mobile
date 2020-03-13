# Covid 19 Triage App

## Important notes:

#### Use of `json_serializable`
If you clone this project, and because it relies on [json_serializable](https://pub.dev/packages/json_serializable) which generates JSON serializable Dart model classes, before running the first time, just make sure that you:

1. Update your packages by running `flutter pub get`
2. Run `flutter pub run build_runner build --delete-conflicting-outputs` to generate the model classes.

When you create a new class, follow the details given on the [package](https://pub.dev/packages/json_serializable) itself.

#### Use of `intl` tools
To make it easier to support and handle intl translations, this project takes advantage of **Flutter Intl**.
Please, make sure you have it enabled on your IDE, otherwise it won't be able to generate new translations automatically for you.
Check the details below for your IDE.
- [Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=localizely.flutter-intl#user-content-flutter-intl-initialize)
- [Android Studio / IntelliJ](https://plugins.jetbrains.com/plugin/13666-flutter-intl)