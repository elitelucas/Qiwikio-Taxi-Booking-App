import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class Today extends StatefulWidget {
  const Today({Key key}) : super(key: key);

  @override
  _TodayState createState() => _TodayState();
}

class _TodayState extends State<Today> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryfont,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Today',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
          child: Column(
            children: [
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: TextSpan(
                                text: 'Fuel level',style: Textt1.textStyle(kPrimaryfont, 15),
                                children: [
                                  TextSpan(text: '  2.12pm',style: Textt1.textStyle(Colors.grey, 15.0)),
                                ]
                            ),
                            ),
                            Text('\$43',style: Textt1.textStyle(kPrimaryfont, 15),),

                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: TextSpan(
                                text: '\$4.56/G',style: Textt2.textStyle(kPrimaryfont, 16),
                                children: [
                                  TextSpan(text: '  8.25G',style: Textt2.textStyle(kPrimaryfont, 16.0)),
                                ]
                            ),
                            ),
                            Image.asset('assets/icons/fuel.png',height: 40,),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: TextSpan(
                                text: ' Ride',style: Textt1.textStyle(kPrimaryfont, 15),
                                children: [
                                  TextSpan(text: '  3.12pm',style: Textt1.textStyle(Colors.grey, 15.0)),
                                ]
                            ),
                            ),
                            Text('\$456',style: Textt1.textStyle(kPrimaryfont, 15),),

                          ],
                        ),

                        Container(
                          height: 50,
                          child: Row(
                            children: [
                              Expanded(child: Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: 7,),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                    DottedLine(
                                      direction: Axis.vertical,
                                      lineLength: 16,
                                      lineThickness: 1.0,
                                      dashLength: 4.0,
                                      dashColor: Colors.grey,
                                      dashRadius: 0.0,
                                      dashGapLength: 4.0,
                                      dashGapColor: Colors.transparent,
                                      dashGapRadius: 0.0,
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: kPrimarycolor,
                                        borderRadius: BorderRadius.circular(20.0),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                              Expanded(
                                  flex: 20,
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('2972 Westheimer Rd. Santa Ana, Illinois 85486',style: Textt1.textStyle(Colors.grey, 12),),
                                        Text('6391 Elgin St. Celina, Delaware 10299',style: Textt1.textStyle(Colors.grey, 12),),

                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(text: TextSpan(
                                text: ' 15 Km',style: Textt1.textStyle(Colors.grey, 15),
                                children: [
                                  TextSpan(text: '  1 hour',style: Textt1.textStyle(Colors.grey, 15.0)),
                                  TextSpan(text: '  13.6L/100km',style: Textt1.textStyle(Colors.grey, 15.0)),

                                ]
                            ),
                            ),
                            Image.asset('assets/icons/graph.png',height: 40,),

                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
