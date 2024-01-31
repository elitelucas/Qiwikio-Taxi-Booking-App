import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Truck Driver/reachedpickup.dart';

class DeliveryDetail extends StatefulWidget {
  const DeliveryDetail({Key key}) : super(key: key);

  @override
  _DeliveryDetailState createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  String _verticalGroupValue = "";

  List<String> _status = [''];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back,color: kPrimaryfont,), onPressed: (){}),
        title: Text('Order Details',style: Textt2.textStyle(kPrimaryfont, 15.0),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 210,
                decoration: BoxDecoration(
                  color: Color(0xffF7FAFC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(left: 12, top: 10),
                              child: RadioGroup<String>.builder(
                                direction: Axis.vertical,
                                groupValue: _verticalGroupValue,
                                onChanged: (value) => setState(() {
                                  _verticalGroupValue = value;
                                }),
                                items: _status,
                                itemBuilder: (item) => RadioButtonBuilder(
                                  item,
                                ),
                                activeColor: kPrimarycolor,
                              ),
                            ),
                            DottedLine(
                              direction: Axis.vertical,
                              lineLength: 85,
                              lineThickness: 1.0,
                              dashLength: 4.0,
                              dashColor: Colors.grey,
                              dashRadius: 0.0,
                              dashGapLength: 4.0,
                              dashGapColor: Colors.transparent,
                              dashGapRadius: 0.0,
                            ),
                            Icon(
                              FontAwesome.location,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pickup",
                              style: Textt2.textStyle(Colors.grey, 14),
                            ),
                            Text(
                              "New Wellington Alluminium Shop",
                              style: Textt2.textStyle(kPrimaryfont, 15),
                            ),
                            Text(
                              "12 : 00 PM",
                              style: Textt2.textStyle(kPrimaryfont, 12),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            Text(
                              "Drop-off",
                              style: Textt2.textStyle(Colors.grey, 14),
                            ),
                            Text(
                              "105 William St, Chicago, US",
                              style: Textt2.textStyle(kPrimaryfont, 15),
                            ),
                            Text(
                              "1 : 30 PM",
                              style: Textt2.textStyle(kPrimaryfont, 12),
                            ),
                            Divider(
                              thickness: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffF7FAFC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/icons/container.png',
                            fit: BoxFit.fill,
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Medium",
                                    style: Textt2.textStyle(
                                        kPrimaryfont, 15),
                                  ),
                                  Text(
                                    "\$128.00",
                                    style: Textt2.textStyle(
                                        kPrimaryfont, 14),
                                  ),
                                ],
                              ),
                              Text(
                                "Between 2kg and 5kg",
                                style: Textt1.textStyle(Colors.grey, 14),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 350.0),
                child: AuthButton(colorr: kPrimarycolor,
                textt: 'Navigate to Pickup location',
                  textStyle: Textt1.textStyle(Colors.white, 15.0),
                  onchanged: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ReachedPickup()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
