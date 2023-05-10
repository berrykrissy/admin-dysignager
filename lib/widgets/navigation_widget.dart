import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class NavigationWidget extends BaseWidget {
  
  const NavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 30,
      child: Container(
        color: Colors.red,
        alignment: Alignment.center,
        child: Column(),
      )
    );
  }
}