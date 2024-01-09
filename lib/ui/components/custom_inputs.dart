import 'package:flutter/material.dart';

class CustomInputs {
  InputDecoration formInputDecoration({
    String? hint,
    required String label,
    required IconData icon,
    double maxWidth = double.infinity,
    double maxHeight = double.infinity,
    bool autoSuggest = false,
    Color labelColor = const Color(0xFF2e5899),
    Color hintColor = const Color(0xFF8aa7d2),
  }) {
    return InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(icon, size: 20, color: hintColor),
        ),
        prefixIconConstraints: const BoxConstraints(maxWidth: 50),
        border: OutlineInputBorder(
            borderRadius: getBorderRadius(autoSuggest),
            borderSide: getBordeSide(
                autoSuggest, const Color.fromARGB(255, 194, 212, 239))),
        enabledBorder: OutlineInputBorder(
            borderRadius: getBorderRadius(autoSuggest),
            borderSide: getBordeSide(
                autoSuggest, const Color.fromARGB(255, 194, 212, 239))),
        focusedBorder: OutlineInputBorder(
            borderRadius: getBorderRadius(autoSuggest),
            borderSide: getBordeSide(autoSuggest, Colors.blue.shade900)),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: TextStyle(color: hintColor, fontSize: 14.5),
        labelText: label,
        labelStyle: TextStyle(
            color: labelColor, fontSize: 14.5, fontWeight: FontWeight.w600),
        constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth));
  }

  BorderRadius getBorderRadius(autoSuggest) {
    if (autoSuggest) {
      return const BorderRadius.only(
          topLeft: Radius.circular(22), topRight: Radius.circular(22));
    } else {
      return BorderRadius.circular(50);
    }
  }

  BorderSide getBordeSide(autoSuggest, color) {
    if (autoSuggest) {
      return BorderSide.none;
    } else {
      return BorderSide(color: color);
    }
  }
}
