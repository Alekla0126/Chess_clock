// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> es_SP = {
  "Add_game": "Añade un juego personalizado",
  "title": "Reloj de ajedrez",
  "Settings": "Configuración",
  "Theme": "Tema",
  "Choose_theme": "Escoje un tema diferente",
  "Vibration": "Vibración",
  "Customize_haptic": "Personaliza la retroalimentación háptica",
  "Title": "Título",
  "Select_time": "Selecciona la duración",
  "Confirm": "Confirmar",
  "Rate_this_app": "Califica la aplicación",
  "Light_theme": "Claro",
  "Dark_theme": "Oscuro",
  "Vibration_on": "Vibración encendida",
  "Vibration_off": "Vibración apagada",
  "Cancel": "Cancelar",
  "Espanol": "Español",
  "English": "English",
  "Change_language": "Cambia el lenguaje"
};
static const Map<String,dynamic> en_US = {
  "Add_game": "Add custom game",
  "title": "Chess clock",
  "Settings": "Settings",
  "Theme": "Theme",
  "Choose_theme": "Choose a different theme",
  "Vibration": "Vibration",
  "Customize_haptic": "Customize the haptic feedback",
  "Title": "Title",
  "Select_time": "Select time",
  "Confirm": "Confirm",
  "Rate_this_app": "Rate this app",
  "Light_theme": "Light",
  "Dark_theme": "Dark",
  "Vibration_on": "Vibration on",
  "Vibration_off": "Vibration off",
  "Cancel": "Cancel",
  "Espanol": "Español",
  "English": "English",
  "Change_language": "Change the language"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"es_SP": es_SP, "en_US": en_US};
}
