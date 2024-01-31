import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:qwikio_driver/Login&Signup/carsignup.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Login&Signup/bikesignup.dart';
import 'package:qwikio_driver/Login&Signup/taxisignup.dart';
import 'package:qwikio_driver/Login&Signup/trucksignup.dart';



class TabList extends StatefulWidget {
  const TabList({Key key}) : super(key: key);

  @override
  _TabListState createState() => _TabListState();
}

class _TabListState extends State<TabList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(
      text: 'Car',

    ),

    // second tab [you can add an icon using the icon property]
    Tab(
      text: 'Bike',
    ),
    Tab(
      text: 'Taxi',
    ),
    Tab(
      text: 'Truck',
    ),

  ];

  @override
  void initState() {
    _tabController = TabController(length: list.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: list.length,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 60),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Create you Account Here!',
                      style: Textt2.textStyle(kSecondaryfont, 30),
                    ),
                    Text(
                      'Stay signed in with your account to',
                      style: Textt1.textStyle(kSecondaryfont, 15),
                    ),
                    Text(
                      'make searching easier',
                      style: Textt1.textStyle(kSecondaryfont, 15),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Center(
              child: Container(
                height: 40,
                width: 340,
                decoration: BoxDecoration(
                  color: Color(0xffE8F5FF),
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),

                ),
                child: new TabBar(
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BubbleTabIndicator(
                      indicatorHeight: 40.0,
                      indicatorRadius: 12,
                      indicatorColor: kPrimarycolor,
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.grey,
                    unselectedLabelStyle: Textt1.textStyle(Colors.grey, 14),
                    tabs: list),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                CarSignup(),
                  BikeSignup(),
                  TaxiSignup(),
                  TruckSignup(),



                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
