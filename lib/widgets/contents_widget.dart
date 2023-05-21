import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signage/widgets/base_widgets.dart';

class ContentsWidget extends BaseWidget {
  const ContentsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 70,
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.yellow,
          alignment: Alignment.center,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to DYSIGNER Dashboard!",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Dysignager",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 13,
              ),
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
                            color: Colors.green,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Preview'),
                                SizedBox(
                                  height: 13,
                                ),
                                Container(
                                  height: 300,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
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
                                  color: Colors.green,
                                  height: 350,
                                  width: 485,
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
