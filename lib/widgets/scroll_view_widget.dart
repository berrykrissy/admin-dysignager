import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';

class ScrollViewWidget extends BaseWidget {

  const ScrollViewWidget( {
    super.key,
    required this.children,
    this.isScrollable,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.padding,
    this.scrollContoller,
  } );

  final List<Widget> children;
  final bool? isScrollable;
  final MainAxisAlignment? mainAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final EdgeInsetsGeometry? padding;
  final ScrollController? scrollContoller;

   @override
  Widget build(BuildContext context) {
    return Scrollbar (
        controller: scrollContoller,
        thickness: 10,
        trackVisibility: true, //showTrackOnHover: true,
        thumbVisibility: true, //isAlwaysShown: true,
        child: SingleChildScrollView (
          physics: isScrollable ?? true ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
          child: Padding (
            padding: padding ?? EdgeInsets.zero,
            child: Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
              mainAxisSize: mainAxisSize ?? MainAxisSize.max,
              children: children,
            ),
          ),
        )
      );
  } 
}