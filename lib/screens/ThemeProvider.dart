import 'package:flutter/material.dart';

// Clase para gestionar el tema de la aplicación
class ThemeProvider with ChangeNotifier {
  // Variable para almacenar el modo actual del tema
  ThemeMode _themeMode = ThemeMode.light;

  // Getter para obtener el modo actual del tema
  ThemeMode get themeMode => _themeMode;

  // Método para cambiar el tema
  void changeTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners(); // Notifica a los oyentes sobre el cambio de tema
  }
}
