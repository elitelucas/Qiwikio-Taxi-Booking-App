import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';


class CarDetail extends StatefulWidget {
  const CarDetail({Key key}) : super(key: key);

  @override
  _CarDetailState createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      appBar: AppBar(
        elevation: 0,
        title: Text('Vehicle Details',style: Textt2.textStyle(kPrimaryfont, 18.0),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: kPrimaryfont,), onPressed: (){}),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Container(
                      height: 150,
                      child: Image.asset('assets/images/car.png',fit: BoxFit.fill,),
                    ),
                  ),
                  Positioned(
                    right: 5.0,
                    bottom: 5,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30.0)),
                          child: IconButton(icon: Icon(Icons.camera_alt), onPressed: (){})),
                    ),
                  ),

                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('BMW 5 Series Sedan­',style: Textt2.textStyle(kPrimaryfont, 22.0),),
                      SizedBox(width: 20.0,),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        ),
                        child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30.0)),
                            child: IconButton(icon: Icon(FontAwesomeIcons.pencilAlt,size: 20,), onPressed: (){})),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star,size: 15,color: kPrimarycolor,),
                      Text(' 4.2',style: Textt2.textStyle(kPrimaryfont, 12.0),),
                      Text(' (47)',style: Textt2.textStyle(Colors.grey, 12.0),),

                    ],
                  ),

                ],
              ),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 30,
                          child: Image.asset('assets/icons/maker.png'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            'Car maker',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'BMW',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 30,
                          child: Image.asset('assets/icons/ride.png'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            'Car model',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '2019',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 30,
                          child: Image.asset('assets/icons/color.png'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Text(
                            'Car colour',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Car model',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          height: 30,
                          child: Image.asset('assets/icons/vehicleno.png'),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Vehicle Number',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                      flex: 2,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'US-230R28',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20,),
              AuthButton(
                colorr: kPrimarycolor,
                textt: 'Update Profile',
                textStyle: Textt1.textStyle(Colors.white, 15.0),
                onchanged: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
