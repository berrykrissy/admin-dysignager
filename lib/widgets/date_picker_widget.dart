
import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class DatePickerWidget extends BaseWidget {
  
  DatePickerWidget( {
    super.key,
    this.labelText,
    this.hintText,
    this.dateController,
  } );

  final String? labelText;
  final String? hintText;
  final TextEditingController? dateController;

  @override
  Widget build(BuildContext context) {
    return TextField (
      controller: dateController, //editing controller of this TextField
      decoration: const InputDecoration( 
        icon: Icon( Icons.calendar_today ),
        //labelText: labelText,
        //hintText: hintText,
        border: OutlineInputBorder (
          borderSide: BorderSide( color: Colors.blue, width: 1 ) ),
          focusedBorder: OutlineInputBorder( borderSide: BorderSide( color: Colors.blue, width: 1 ) ),
          enabledBorder: OutlineInputBorder( borderSide: BorderSide( color: Colors.blue, width: 1 ) ),
      ),
      readOnly: true,  // when true user cannot edit text 
      onTap: () async { //when click we have to show the datepicker
        DateTime? pickedDate = await showDatePicker (
          context: context,
          initialDate: DateTime.now(),
          firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
          lastDate: DateTime(2101)
        );
        if (pickedDate != null) {
          dateController?.text = pickedDate.toString();
        }
      },
    );
  }
}