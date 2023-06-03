import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class AddIconWidget extends BaseWidget {
  
  const AddIconWidget( {
    super.key,
    required this.isVisible,
  });

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    if (isVisible) {
      return const Center (
        child: Icon (
          CupertinoIcons.add_circled,
          color: Colors.black,
        )
      );
    } else {
      return const Center();
    }
  }
}