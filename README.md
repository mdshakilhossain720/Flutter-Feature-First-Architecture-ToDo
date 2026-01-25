# cleanarchitectureflutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

// code all
flutter run -t lib/main_dev.dart --flavor dev
flutter run -t lib/main_uat.dart --flavor uat
flutter run -t lib/main_prod.dart --flavor prod
Or build APK/AAB:

flutter build apk --flavor uat -t lib/main_uat.dart
flutter build appbundle --flavor prod -t lib/main_prod.dart

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
