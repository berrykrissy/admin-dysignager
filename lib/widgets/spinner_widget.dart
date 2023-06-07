import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signage/widgets/base_widgets.dart';

class SpinnerWidget extends BaseWidget {
  
  const SpinnerWidget( { 
    super.key,
    required this.list,
    required this.liveValue,
  } );

  final List<String?> list;
  final RxString liveValue;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButton (
        elevation: 1,
        icon: Icon( Icons.arrow_drop_down, color: Colors.purple[400], ),
        items: list.map<DropdownMenuItem<String>>((String? value) {
          return DropdownMenuItem<String> (
            value: value,
            child: Text(value ?? "Nil"),
          );
        } ).toList(),
        value: liveValue.value,
        onChanged: (String? newValue) { 
          liveValue(newValue);
        },
      );
    }, );
  }
}