import 'package:flutter/material.dart';
import 'package:signage/widgets/navigation_cell_widget.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationCellTextWidget extends NavigationCellWidget {
  NavigationCellTextWidget( {
    super.key,
    required String text,
    //required bool isHovered,
    Function? onHover,
    //Function? onExit,
    GestureTapCallback? onTap,
  } ) : super (
    
    onHover: () {
      //debugPrint("NavigationCellTextWidget onHovers $text");
    },

    onExit: () {
      //debugPrint("NavigationCellTextWidget onExit $text");
    },
  
    child: InkWell (
      onHover: (value) {
      },
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 65),
        padding: const EdgeInsets.only(bottom: 40),
        child: Text (
          text,
          style: GoogleFonts.roboto(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.black54
          ),
        ),
      ),
    ),
  );

}