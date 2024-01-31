import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/OBD/today.dart';
import 'package:qwikio_driver/Screens/s/OBD/journey.dart';
import 'package:qwikio_driver/Screens/s/OBD/error.dart';


class Diagnostic extends StatefulWidget {
  static String id = 'diagnostic';
  const Diagnostic({Key key}) : super(key: key);

  @override
  _DiagnosticState createState() => _DiagnosticState();
}

class _DiagnosticState extends State<Diagnostic> {
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
          'Diagnostic',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(left: 20.0,right: 20.0,),
        child: Column(
            children: [
              SizedBox(height: 10,),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
            height: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
          ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text('BMW 5 Series Sedan',style: Textt2.textStyle(kPrimaryfont, 24.0),),
                       Text('Parked',style: Textt1.textStyle(Colors.grey, 14.0),),
                       Image.asset('assets/images/car.png',height: 150,),
                       Text('1901 Thornridge Cir. Shiloh, Hawaii 81063',style: Textt1.textStyle(kPrimaryfont, 14.0),),

                     ],
                    ),
                  ),
        ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icons/battery.png',height: 140,),
                  Image.asset('assets/icons/vehicle.png',height: 140,),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Toady',style: Textt2.textStyle(kPrimaryfont, 15),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Today()));
                      },
                      child: Text('View more',style: Textt2.textStyle(kPrimarycolor, 15),)),

                ],
              ),

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Issues',style: Textt2.textStyle(kPrimaryfont, 15),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Errors()));
                      },
                      child: Text('View more',style: Textt2.textStyle(kPrimarycolor, 15),)),

                ],
              ),
              Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  height: 140,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(text: TextSpan(
                            text: '1 Issue Found',style: Textt1.textStyle(kPrimaryfont, 15),
                            children: [
                              TextSpan(text: '  2.12pm',style: Textt1.textStyle(Colors.grey, 15.0)),
                            ]
                        ),
                        ),

                        Text('Your engine power is low ',style: Textt1.textStyle(Colors.grey, 15.0)),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 170,
                              decoration: BoxDecoration(
                                color: kPrimarycolor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Center(
                                child: Text('Call for Assistance',style: Textt1.textStyle(Colors.white,15),),
                              ),
                            ),
                            Text('   Clear Issue',style: Textt2.textStyle(kPrimarycolor,15),),

                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Journey',style: Textt2.textStyle(kPrimaryfont, 15),),
                  InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Journey()));
                      },
                      child: Text('View more',style: Textt2.textStyle(kPrimarycolor, 15),)),

                ],
              ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Jan 2021',style: Textt1.textStyle(Colors.grey, 15),),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                Text('You drove 24321 miles in 69:42:32  ',style: Textt1.textStyle(kPrimaryfont, 14),),

                                Image.asset('assets/icons/doc.png',height: 20,),
                              ],
                            ),
                            IconButton(icon: Icon(Icons.keyboard_arrow_down_outlined,size: 25,color: kPrimaryfont,), onPressed: (){}),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 30,
              ),
            ],
        ),
        ),
      ),
    );
  }
}
