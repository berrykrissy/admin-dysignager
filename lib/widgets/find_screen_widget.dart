import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/dashboard_header_Widget.dart';
import 'package:signage/widgets/flutter_map_widget.dart';
import 'package:signage/widgets/status_widget.dart';

class FindScreenWidget extends BaseWidget {
  
  const FindScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 70,
      child: Container (
        padding: const EdgeInsets.all(30),
        alignment: Alignment.center,
        child: const Column (
          children: [
            DashboardHeaderWidget(),
            SizedBox(height: 13,),
            StatusWidget(),
            SizedBox(height: 13,),
            FlutterMapWidget(),
          ]
        ),
      )
    );
  }
}