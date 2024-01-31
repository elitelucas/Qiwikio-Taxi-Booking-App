import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/OBD/diagnostic.dart';
import 'package:qwikio_driver/Screens/s/Profile/addcard.dart';
import 'package:qwikio_driver/Screens/s/Profile/myprofile.dart';
import 'package:qwikio_driver/Screens/s/Profile/cardetail.dart';
import 'package:qwikio_driver/Screens/s/Profile/documents.dart';
import 'package:qwikio_driver/Screens/s/Profile/reward.dart';
import 'package:qwikio_driver/Screens/s/Profile/withdraw.dart';
import 'package:qwikio_driver/Screens/s/Profile/earninghistory.dart';
import 'package:qwikio_driver/Screens/s/Profile/legalinfo.dart';
import 'package:qwikio_driver/Screens/s/Profile/sharerating.dart';

import 'currency&lang.dart';



class Profile extends StatefulWidget {
  static String id = "profile";

  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
   ThemeMode themeMode;

  @override
  void initState() {
    super.initState();
    themeMode = ThemeMode.light;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage:  AssetImage(
                          'assets/images/man.png',
                        ),
                      ),
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Murphy Shaun',
                                style: Textt2.textStyle(kPrimaryfont, 18.0),
                              ),
                              Text(
                                'Driver',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 1,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyProfile()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Image.asset('assets/icons/person.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'My Profile',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CarDetail()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Image.asset('assets/icons/obd.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Vehicle details',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Diagnostic()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child:
                            Image.asset('assets/icons/obd.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'OBD Diagnostics',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Documents(
                        themeMode: (ThemeMode mode) {
                          setState(() {
                            themeMode = mode;
                          });
                        },
                      )));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Image.asset('assets/icons/info.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Documents',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddCard()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Image.asset('assets/icons/card.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Payout methods',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WithDraw()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Image.asset('assets/icons/withdraw.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Withdraw money',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  EarningHistory()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 30,
                        child: Image.asset('assets/icons/tran.png'),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Earning history',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: 18,
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Reward()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 30,
                            child: Image.asset('assets/icons/reward.png'),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Rewards',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  CurrencyLang()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 30,
                            child: Image.asset('assets/icons/globe.png'),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Currency & Language info',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ShareRating()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 30,
                            child: Image.asset('assets/icons/rating.png'),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Transfer your ratings',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LegalInfo()));
                },
                child: Container(
                  height: 90,
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                            height: 30,
                            child: Image.asset('assets/icons/info.png'),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 3,
                          child: Container(
                            child: Text(
                              'Legal info',
                              style: Textt2.textStyle(kPrimaryfont, 15.0),
                            ),
                          )),
                      Expanded(
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      size: 18,
                                    ),
                                    onPressed: () {}),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.red,
                      ),
                      onPressed: () {}),
                  Text(
                    'Log out',
                    style: Textt2.textStyle(Colors.red, 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
