import 'package:check_radio_group/check/check_group.dart';
import 'package:check_radio_group/model/group_style.dart';
import 'package:check_radio_group/model/item_group.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Profile/addcard.dart';

class WithDraw extends StatefulWidget {
  const WithDraw({Key key}) : super(key: key);

  @override
  _WithDrawState createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDraw> {
  final List<GroupItem> checkItems1 = [
    GroupItem(title: '•••• 4432 '),
  ];
  final List<GroupItem> checkItems2 = [
    GroupItem(title: '•••• 4432 '),
  ];

  final List<GroupItem> checkItems3 = [
    GroupItem(title: 'Quickio Pay'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFDFD),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryfont,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Withdraw Money',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0,right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account',style: Textt2.textStyle(kPrimaryfont, 16.0),),
              Row(
                children: [
                  Image.asset('assets/icons/usd.png',height: 30,),
                  SizedBox(width: 8.0,),
                  Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 8.0,),
                  Text('2200.00',style: Textt2.textStyle(kPrimaryfont, 20.0),),

                ],
              ),

              Container(
                height: 360,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckGroup(
                                  items: checkItems1,
                                  style: GroupStyle(
                                      activeColor: Colors.green,
                                      checkPosition: ListTileControlAffinity.leading,
                                      titleAlign: TextAlign.left,
                                      titleStyle: Textt2.textStyle(kPrimaryfont, 15)),
                                  onSelectedItems: (items) {
                                    items.forEach((item) => print(item.title));
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text('Exp. in 06/21',style: Textt1.textStyle(Colors.grey, 15),),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                                icon: Icon(FontAwesomeIcons.ellipsisV),
                                onPressed: () {}))
                      ],
                    ),
                    Divider(thickness: 1,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckGroup(
                                  items: checkItems2,
                                  style: GroupStyle(
                                      activeColor:  Colors.green,
                                      checkPosition: ListTileControlAffinity.leading,
                                      titleAlign: TextAlign.left,
                                      titleStyle: Textt2.textStyle(kPrimaryfont, 15)),
                                  onSelectedItems: (items) {
                                    items.forEach((item) => print(item.title));
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text('Exp. in 06/21',style: Textt1.textStyle(Colors.grey, 15),),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                                icon: Icon(FontAwesomeIcons.ellipsisV),
                                onPressed: () {}))
                      ],
                    ),
                    Divider(thickness: 1,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 10,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CheckGroup(
                                  items: checkItems3,
                                  style: GroupStyle(
                                      activeColor: Colors.green,
                                      checkPosition: ListTileControlAffinity.leading,
                                      titleAlign: TextAlign.left,
                                      titleStyle: Textt2.textStyle(kPrimaryfont, 15)),
                                  onSelectedItems: (items) {
                                    items.forEach((item) => print(item.title));
                                  }),
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text('\$623.00 available',style: Textt1.textStyle(Colors.grey, 15),),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: IconButton(
                                icon: Icon(FontAwesomeIcons.ellipsisV),
                                onPressed: () {}))
                      ],
                    ),
                    Divider(thickness: 1,),

                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AddCard(

                            )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.add,
                                  color: kPrimarycolor,
                                ),
                                onPressed: () {}),
                            Text(
                              'Add new method',
                              style: Textt1.textStyle(kPrimarycolor, 15.0),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AuthButton(colorr: kPrimarycolor,
                    textt: 'Withdraw',
                      textStyle: Textt1.textStyle(Colors.white, 15.0),
                      onchanged: (){
                      _congo();
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
  _congo() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: Stack(
              children: [
                Container(
                  height: 150,
                  child: Image.asset(
                    'assets/images/ok.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 2.0,
                    child: IconButton(
                        icon: Icon(FontAwesome.cancel, color: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            ),
            content: Container(
              height: 70,
              child: Column(
                children: [
                  Text(
                    'Success!',
                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                  ),
                  Text(
                    'You’ve successfully withdrawed your money',
                    style: Textt1.textStyle(kPrimaryfont, 12.0),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DottedBorder(
                      borderType: BorderType.RRect,
                      dashPattern: [5.0],
                      color: Colors.lightBlue,
                      radius: Radius.circular(12.0),
                      padding: EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 100,
                          width: 300,
                          color: Color(0xffF6FBFF),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Request Amount',
                                style: Textt1.textStyle(Colors.grey, 10),
                              ),
                              Text(
                                '\$2200.00',
                                style: Textt2.textStyle(kPrimaryfont, 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From',style: Textt1.textStyle(Colors.grey, 15),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('John Doe',style: Textt2.textStyle(kPrimaryfont, 15),),
                            Text('Pod Account',style: Textt1.textStyle(Colors.grey, 15),),

                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('To',style: Textt1.textStyle(Colors.grey, 15),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('John Doe',style: Textt2.textStyle(kPrimaryfont, 15),),
                            Text('Visa card',style: Textt1.textStyle(Colors.grey, 15),),

                          ],
                        )
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Date & Time',style: Textt1.textStyle(Colors.grey, 15),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('4 April,2021',style: Textt2.textStyle(kPrimaryfont, 15),),
                            Text('5:25 PM',style: Textt1.textStyle(Colors.grey, 15),),

                          ],
                        )
                      ],
                    ),
                    Divider(),
                    SizedBox(height: 15.0,),
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      focusElevation: 10,
                      highlightElevation: 10,
                      hoverElevation: 10,
                      color: kPrimarycolor,
                      elevation: 4,
                      child: SizedBox(
                        width: 265,
                        height: 55,
                        child: Center(
                            child: Text(
                              'Done',
                              style: Textt1.textStyle(Colors.white, 15),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                  ],
                ),
              ),
            ],
          );
        });
  }

}
