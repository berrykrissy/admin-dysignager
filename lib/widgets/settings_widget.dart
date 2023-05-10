import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class SettingsWidget extends BaseWidget {
  
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 70,
      child: Container(
        color: Colors.yellow,
        alignment: Alignment.center,
        child: Text("Settings"),
      )
    );
  }

}