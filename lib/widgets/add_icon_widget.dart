import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signage/controllers/dashboard_controller.dart';
import 'package:signage/widgets/base_widgets.dart';

class AddIconWidget extends BaseWidget<DashboardController> {
  
  AddIconWidget( {
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    if (controller.isIconHidden(index)) {
      return Center (
        child: Icon(
          CupertinoIcons.add_circled,
          color: Colors.black,
        )
      );
    } else {
      return const Center();
    }
  }


}