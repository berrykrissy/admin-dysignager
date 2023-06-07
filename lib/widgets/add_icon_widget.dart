import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class AddIconWidget extends BaseWidget {
  
  const AddIconWidget( {
    super.key,
    required this.isVisible,
    this.onPressed,
  });

  final bool isVisible;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    if (isVisible) {
      return Center (
        child: IconButton (
          onPressed: onPressed,
          icon: const Icon (
            CupertinoIcons.add_circled,
            color: Colors.black,
          )
        )
      );
    } else {
      return const Center();
    }
  }
}