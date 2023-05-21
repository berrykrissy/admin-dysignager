import 'package:flutter/material.dart';

class ScreensViewModel {

  ScreensViewModel({
    this.name,
    this.quantity,
    this.color,
  });
  
  final String? name;
  final String? quantity;
  final MaterialColor? color;

  @override
  String toString() {
    return "ScreensViewModel name $name, quantity $quantity color${color.toString()}}" ?? super.toString();
  }
}