import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class SpinnerWidget extends BaseWidget {
  
  SpinnerWidget( { 
    super.key,
    //this.spinnerItems,
  } );

  List <String> spinnerItems = [
    'One', 
    'Two', 
    'Three', 
    'Four', 
    'Five'
    ] ;

  @override
  Widget build(BuildContext context) {
    return DropdownButton (
      elevation: 1,
      icon: Icon(Icons.arrow_drop_down, color: Colors.purple[400],),
      items: spinnerItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      } ).toList(), 
      onChanged: (String? newValue) { 
        
      },
    );
    
  }

}