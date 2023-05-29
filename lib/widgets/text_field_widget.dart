import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class TextFieldWidget extends BaseWidget {

  const TextFieldWidget ( {
    super.key, 
    required this.labelText,
    required this.hintText,
    this.isObscureText,
    this.textEditingController,
  } );
  
  final String labelText;
  final String hintText;
  final bool? isObscureText;
  final TextEditingController? textEditingController;


  @override
  Widget build(BuildContext context) {
    return TextField (
      controller: textEditingController,
      decoration: InputDecoration (
        border: const OutlineInputBorder(),
        labelText: labelText,
        hintText: hintText
      ),
      obscureText: isObscureText ?? false,
    );
  }
}