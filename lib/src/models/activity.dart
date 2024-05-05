import 'package:flutter/material.dart';

class Activity {
  Activity(this.name) : color = _generateColor(name);

  final String name;
  final Color color;

  static Color _generateColor(String name) {
    final hash = name.hashCode;
    final hue = hash % 360.0;
    double saturation = 0.25 + (hash % 100) / 100;
    if (saturation > 1.0) {
      saturation = 1.0;
    }
    double lightness = 0.25 + (hash % 100) / 100;
    if (lightness > 1.0) {
      lightness = 1.0;
    }

    final hslColor = HSLColor.fromAHSL(1.0, hue, saturation, lightness);
    return hslColor.toColor();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Activity &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
