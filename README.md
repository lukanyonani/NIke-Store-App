# Nike Store App

A Flutter shoe-shopping concept app with interactive 3D product viewing — rotate and inspect each shoe as a 3D model instead of flipping through static photos.

## Features

- Browse a shoe catalog with an animated, focus-aware search bar
- Product detail screen with an interactive 3D model viewer (`o3d` / `flutter_3d_controller`)
- Splash screen and smooth screen transitions

## Tech stack

- **Flutter**
- `model_viewer_plus`, `flutter_3d_controller`, `o3d` for 3D model rendering

## Project layout

```
lib/
  views/
    splashscreen.dart
    home_screen.dart
    detail_screen.dart
```

## Getting started

```bash
flutter pub get
flutter run
```
