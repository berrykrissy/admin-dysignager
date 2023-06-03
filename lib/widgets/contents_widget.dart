import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signage/widgets/base_widgets.dart';
import 'package:signage/widgets/dashboard_header_Widget.dart';

class ContentsWidget extends BaseWidget {
  const ContentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 70,
        child: Container(
          padding: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Column(
            children: [
              DashboardHeaderWidget(),
              SizedBox(height: 13,),
              Card(
                margin: EdgeInsets.all(25),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(25, 30, 25, 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Contents',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 25,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 350,
                            width: 400,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Preview',
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45),
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Container(
                                  height: 300,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Container(
                            height: 350,
                            width: 485,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Edit Playlist',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black45),
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      'Cancel',
                                      style: GoogleFonts.roboto(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black45),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Update',
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
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Name',
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black45),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          width: 400,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.black),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Text('Sample Playlist'),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Media to Display',
                                          style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black45),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
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
                                                              'Photo1.jpg x')),
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
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 200,
                                              height: 25,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
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
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
