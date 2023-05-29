import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ButtonWidget extends BaseWidget {

  const ButtonWidget ( {
    super.key, 
    required this.text,
    required this.onPressed, 
    this.textColor, 
    this.fillColor, 
    this.splashColor
  } );
  
  final String text;
  final GestureTapCallback onPressed;
  final Color? textColor;
  final Color? fillColor;
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: fillColor ?? Colors.indigo,
      highlightElevation: 5.0,
      onPressed: onPressed,
      //shape: StadiumBorder(),
      splashColor: splashColor ?? Colors.indigoAccent,
      child: Text(
        text,
        style: TextStyle (
          color: textColor ?? Colors.white
        ),
      ),
      );
  }
}