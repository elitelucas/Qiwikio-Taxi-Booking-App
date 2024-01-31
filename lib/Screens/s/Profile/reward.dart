import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class Reward extends StatefulWidget {
  static String id = "reward";

  const Reward({Key key}) : super(key: key);

  @override
  _RewardState createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  SfRangeValues _values = SfRangeValues(0.0, 40.0);
  double _value = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      appBar: AppBar(
        backgroundColor: Color(0xff2A2B50),
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Icon(
                      FontAwesomeIcons.question,
                      size: 15,
                      color: Colors.black,
                    )),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color(0xff2A2B50),
              height: 270,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/diamond.png',
                      height: 70,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Qwikio Diamond',
                      style: Textt2.textStyle(Colors.white, 15.0),
                    ),
                    Text(
                      'Through Aug 22',
                      style: Textt1.textStyle(Colors.grey, 15.0),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 25,right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 230,
                    ),
                    child: Center(
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Container(
                          height: 240,
                          width: 350,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Aug 1 - Dec 31',
                                  style: Textt1.textStyle(kPrimaryfont, 18.0),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '142 level points',
                                      style:
                                          Textt2.textStyle(kPrimaryfont, 22.0),
                                    ),
                                    Text(
                                      'See Details',
                                      style: Textt1.textStyle(
                                          kPrimarycolor, 15.0),
                                    ),
                                  ],
                                ),
                                SfRangeSlider(
                                  min: 0.0,
                                  max: 100.0,
                                  values: _values,
                                  interval: 20,
                                  showTicks: true,
                                  showLabels: true,
                                  enableTooltip: true,
                                  minorTicksPerInterval: 1,
                                  onChanged: (SfRangeValues values) {
                                    setState(() {
                                      _values = values;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                               RichText(text: TextSpan(
                                 text: 'Earn 1,000 more points',style: Textt2.textStyle(kPrimaryfont, 15),
                                 children: [
                                   TextSpan(text: ' and',style: Textt1.textStyle(kPrimaryfont, 15)),
                                   TextSpan(text: ' give',style: Textt2.textStyle(kPrimaryfont, 15)),
                                   TextSpan(text: ' great service to',style: Textt1.textStyle(kPrimaryfont, 15)),
                                   TextSpan(text: ' keep Diamond for another 3 - month period',style: Textt1.textStyle(kPrimaryfont, 15)),

                                 ]

                               ),

                               ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    ' Your Diamond rewards',
                    style: Textt2.textStyle(kPrimaryfont, 18.0),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset('assets/icons/crown.png'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Get 100\$ worth free gas credits',
                                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                                  ),
                                  Text(
                                    'after completing 10 trips today',
                                    style: Textt1.textStyle(Colors.grey, 15.0),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset('assets/icons/star.png'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Reduce your fee by 5%',
                                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                                  ),
                                  Text(
                                    'Complete 50 trips today to reduce your fee by 5%',
                                    style: Textt1.textStyle(Colors.grey, 14.0),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset('assets/icons/rent.png'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Premium rides point boost',
                                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                                  ),
                                  Text(
                                    'Lorem Ipsum is simply dummy text.',
                                    style: Textt1.textStyle(Colors.grey, 15.0),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset('assets/icons/sup.png'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Priority support',
                                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                                  ),
                                  Text(
                                    'Lorem Ipsum is simply dummy text.',
                                    style: Textt1.textStyle(Colors.grey, 15.0),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset('assets/icons/cross.png'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Flexible cancellations',
                                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                                  ),
                                  Text(
                                    'Lorem Ipsum is simply dummy text.',
                                    style: Textt1.textStyle(Colors.grey, 15.0),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset('assets/icons/gift.png'),
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Choose rewards',
                                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                                  ),
                                  Text(
                                    'Lorem Ipsum is simply dummy text.',
                                    style: Textt1.textStyle(Colors.grey, 15.0),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
