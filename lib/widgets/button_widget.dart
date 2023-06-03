import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ButtonWidget extends BaseWidget {

  const ButtonWidget ( {
    super.key, 
    required this.text,
    required this.onPressed, 
    this.highlightElevation,
    this.textColor, 
    this.fillColor, 
    this.splashColor,
    this.fontSize,
    this.fontWeight,
  } );
  
  final String text;
  final GestureTapCallback onPressed;
  final double? highlightElevation;
  final Color? textColor;
  final Color? fillColor;
  final Color? splashColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: fillColor ?? Colors.indigo,
      highlightElevation: highlightElevation ?? 1.0,
      onPressed: onPressed,
      //shape: StadiumBorder(),
      splashColor: splashColor ?? Colors.indigoAccent,
      child: Text(
        text,
        style: TextStyle (
          color: textColor ?? Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      );
  }
}