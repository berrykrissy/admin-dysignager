import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/contents_footer_widget.dart';
import 'package:signage/widgets/dashboard_header_Widget.dart';
import 'package:signage/widgets/list_view_contents_detail_widget.dart';
import 'package:signage/widgets/list_view_contents_header_widget.dart';
import 'package:signage/widgets/scroll_view_widget.dart';

class ContentsWidget extends BaseWidget {
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text( 'Preview',
                          style: GoogleFonts.roboto (
                            textStyle: const TextStyle (
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45
                            ),
                          ),
                        ),
                        Text( 'Edit Playlist',
                          style: GoogleFonts.roboto (
                            textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black45),
                          ),
                        ),
                        Text( 'Cancel',
                          style: GoogleFonts.roboto (
                            textStyle: const TextStyle (
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45
                            ),
                          ),
                        ),
                        Text( 'Update',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.purple[400],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Row (
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon (
                          CupertinoIcons.video_camera_solid,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                    Row (
                      children: [
                        Text( 'Name',
                          style: GoogleFonts.roboto (
                            textStyle: TextStyle (
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black45
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Container (
                          width: 400,
                          height: 25,
                          decoration: BoxDecoration (
                            border: Border.all(color: Colors.black),
                          ),
                          child: Padding (
                            padding: EdgeInsets.only(left: 10),
                            child: Text('Sample Playlist'),
                          ),
                        )
                      ],
                    ),
                    Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text( 'Media to Display',
                              style: GoogleFonts.roboto (
                                textStyle: TextStyle (
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black45
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 25,
                                  decoration: BoxDecoration(border: Border.all(color: Colors.black),),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors
                                                  .purple[200],
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(5)),
                                          child: Center(child: Text('Photo1.jpg x')),
                                        ),
                                        Spacer(),
                                        Text('+1'),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Container(
                                  width: 200,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10, right: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors
                                                  .purple[200],
                                              borderRadius:
                                                  BorderRadius
                                                      .circular(5)),
                                          child: Center(
                                              child: Text(
                                                  'Video1.mp4 x')),
                                        ),
                                        Spacer(),
                                        Text('+1'),
                                        Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox( height: 20,),
                      ],
                    ),
                    Row (
                      children: [
                        Text(
                          '+ Add Media',
                          style: TextStyle(fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          'View all',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ),
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
          ]
        ),
    );;
  }
}