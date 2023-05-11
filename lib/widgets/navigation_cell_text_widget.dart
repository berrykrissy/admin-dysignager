import 'package:flutter/material.dart';
import 'package:signage/widgets/navigation_cell_widget.dart';

class NavigationCellTextWidget extends NavigationCellWidget {
  
  NavigationCellTextWidget( {
    super.key,
    required String text,
    //required bool isHovered,
    //Function? onHover,
    //Function? onExit,
    GestureTapCallback? onTap,
  } ) : super (
    
    onHover: () {
      debugPrint("NavigationCellTextWidget onHovers $text");
    },

    onExit: () {
      debugPrint("NavigationCellTextWidget onExit $text");
    },
  
    child: InkWell (
      child: Text (
        text,
        style: TextStyle (
          color: Colors.white,
          //decoration: TextDecoration.overline,
          fontSize: 13,
        ),
      ),
      onTap: onTap,
    ),
  );

}