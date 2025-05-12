import 'package:flutter/material.dart';

/// {@template bottom_navigation_bar_theme_extension}
/// BottomNavigationBarThemeExtension.
/// {@endtemplate}
final class BottomNavigationBarThemeExtension extends ThemeExtension<BottomNavigationBarThemeExtension> {
  /// {@macro bottom_navigation_bar_theme_extension}
  const BottomNavigationBarThemeExtension({required this.mockNavBarTheme, required this.mockThemeTwo});

  final BottomNavigationBarThemeData mockNavBarTheme;
  final BottomNavigationBarThemeData mockThemeTwo;

  @override
  ThemeExtension<BottomNavigationBarThemeExtension> copyWith() {
    return BottomNavigationBarThemeExtension(mockNavBarTheme: mockNavBarTheme, mockThemeTwo: mockThemeTwo);
  }

  @override
  ThemeExtension<BottomNavigationBarThemeExtension> lerp(
    covariant ThemeExtension<BottomNavigationBarThemeExtension>? other,
    double t,
  ) {
    // TODO: implement lerp
    throw UnimplementedError();
  }

  factory BottomNavigationBarThemeExtension.light() {
    return BottomNavigationBarThemeExtension(
      mockNavBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
      ),
      mockThemeTwo: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }

  factory BottomNavigationBarThemeExtension.dark() {
    return BottomNavigationBarThemeExtension(
      mockNavBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
      ),
      mockThemeTwo: BottomNavigationBarThemeData(
        backgroundColor: Colors.grey,
        elevation: 0,
        selectedIconTheme: const IconThemeData(color: Colors.white),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}

final ligthTheme = ThemeData(extensions: [BottomNavigationBarThemeExtension.light()]);
final darkTheme = ThemeData(extensions: [BottomNavigationBarThemeExtension.dark()]);
