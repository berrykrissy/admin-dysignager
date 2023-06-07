import 'package:flutter/material.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/contents_footer_widget.dart';
import 'package:signage/widgets/dashboard_header_Widget.dart';
import 'package:signage/widgets/list_view_contents_detail_widget.dart';
import 'package:signage/widgets/list_view_contents_header_widget.dart';
import 'package:signage/widgets/scroll_view_widget.dart';

<<<<<<< HEAD
import 'button_widget.dart';

class ContentsWidget extends BaseWidget<DashboardController> {
=======
class ContentsWidget extends BaseWidget {
>>>>>>> main
  const ContentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible (
      flex: 70,
      child: ScrollViewWidget (
          isScrollable: true,
          //scrollContoller: controller.screensScrollController,
          children: [
            const DashboardHeaderWidget(),
            const SizedBox(height: 13,),
            /*
            Card (
              margin: const EdgeInsets.symmetric(horizontal: 40),
              color: Colors.white,
              shape: RoundedRectangleBorder (
                side: const BorderSide(color: Colors.grey,),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container (
                padding: const EdgeInsets.fromLTRB(13, 30, 10, 30),
                child: Column (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("CONTENTS", style: TextStyle ( color: Colors.grey, fontSize: 20, fontWeight: FontWeight.w500,),),
                    const SizedBox(height: 13,),
                    Row (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column (
                          children: [
                            Text ( 'Preview',
                              style: GoogleFonts.roboto (
                                textStyle: const TextStyle (
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column (
                          children: [
                            Row (
                              children: [
                                ButtonWidget (
                                  text: 'Cancel',
                                  style: GoogleFonts.roboto (
                                    textStyle: const TextStyle (
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45
                                    ),
                                  ),
                                  onPressed: () {

                                  },
                                ),
                                const SizedBox( width: 13,),
                                ButtonWidget (
                                  text: 'Upload',
                                  style: GoogleFonts.roboto (
                                    textStyle: TextStyle (
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.purple[400],
                                    ),
                                  ), onPressed: () {

                                  } 
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container (
                          color: Constants.GRAY_OFFLINE,
                          height: 250,
                          width: 250,
                          child: const Icon (
                            CupertinoIcons.video_camera_solid,
                            color: Colors.blue,
                          ),
                        ),
                        Column (
                          children: [
                            Row (
                              children: [
                                Text( 'Screen to Display',
                                  style: GoogleFonts.roboto (
                                    textStyle: const TextStyle (
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45
                                    ),
                                  ),
                                ),
                                const SizedBox( width: 13, ),
                                SpinnerWidget( 
                                  list: controller.getScreenList(), 
                                  liveValue: controller.spinnerValue, 
                                ),
                              ],
                            ),
                            const SizedBox( height: 13,),
                            Row ( 
                              children: [
                                Text( 'Date to Publish',
                                  style: GoogleFonts.roboto (
                                    textStyle: const TextStyle (
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45
                                    ),
                                  ),
                                ),
                                const SizedBox( width: 13, ),
                                SizedBox(
                                  height: 20,
                                  width: 100,
                                  child: DatePickerWidget(dateController: controller.dateFromController,),
                                ),
                                const SizedBox( width: 13,),
                                Text( 'to',
                                  style: GoogleFonts.roboto (
                                    textStyle: const TextStyle (
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45
                                    ),
                                  ),
                                ),
                                const SizedBox( width: 13,),
                                SizedBox(
                                  height: 20,
                                  width: 100,
                                  child: DatePickerWidget(dateController: controller.dateToController,),
                                ),
                              ],
                            ),
                            const SizedBox( height: 13,),
                            Row (
                              children: [
                                Text( 'Media to Display',
                                  style: GoogleFonts.roboto (
                                    textStyle: const TextStyle (
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45
                                    ),
                                  ),
                                ),
                                const SizedBox( width: 20,),
                                Text( 'Duration (s)',
                                  style: GoogleFonts.roboto (
                                    textStyle: const TextStyle (
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black45
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ]
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            */
            const SizedBox(height: 15,),
            const ListViewContentsHeaderWidget(),
            const Divider (
              color: Colors.grey,
              height: 25,
              thickness: 1,
              indent: 5,
              endIndent: 5,
            ),
            const ListViewContentsDetailsWidget(),
            const ContentsFooterWidget(),
            ButtonWidget(
            text:"Add Advertisement", 
            textColor: Colors.grey,
            onPressed: () => controller.processCreateAdvertisement()),
            ButtonWidget(
              text: "Update Advertisement", 
              textColor: Colors.grey,
              onPressed: () => controller.processUpdateAdvertisement())
          ]
        ),
    );
  }
}