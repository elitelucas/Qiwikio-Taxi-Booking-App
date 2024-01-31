import 'package:flutter/material.dart';
import 'package:qwikio_driver/Login&Signup/login.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Res/data.dart';

import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Bording extends StatefulWidget {
  static String id = "onbordingscreen";

  @override
  _BordingState createState() => _BordingState();
}

class _BordingState extends State<Bording> {
  List<SliderModel> mySLides = new List<SliderModel>();
  int slideIndex = 0;
  PageController controller;

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.0),
      height: isCurrentPage ? 10.0 : 6.0,
      width: isCurrentPage ? 10.0 : 6.0,
      decoration: BoxDecoration(
        color: isCurrentPage ? kPrimarycolor : Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mySLides = getSlides();
    controller = new PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xff3C8CE7), const Color(0xff00EAFF)])),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                slideIndex = index;
              });
            },
            children: <Widget>[
              SlideTile(
                imagePath: mySLides[0].getImageAssetPath(),
                title: mySLides[0].getTitle(),
                desc: mySLides[0].getDesc(),
                imageLine: mySLides[0].getImageLine(),
              ),
              SlideTile(
                imagePath: mySLides[1].getImageAssetPath(),
                title: mySLides[1].getTitle(),
                desc: mySLides[1].getDesc(),
                imageLine: mySLides[1].getImageLine(),
              ),
              SlideTile(
                imagePath: mySLides[2].getImageAssetPath(),
                title: mySLides[2].getTitle(),
                desc: mySLides[2].getDesc(),
                imageLine: mySLides[2].getImageLine(),
              ),
            ],
          ),
        ),
        bottomSheet: slideIndex != 2
            ? Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        controller.animateToPage(2,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "SKIP",
                        style: Textt1.textStyle(kPrimaryfont, 15),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            i == slideIndex
                                ? _buildPageIndicator(true)
                                : _buildPageIndicator(false),
                        ],
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        print("this is slideIndex: $slideIndex");
                        controller.animateToPage(slideIndex + 1,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      splashColor: Colors.blue[50],
                      child: Text(
                        "NEXT",
                        style: Textt1.textStyle(kPrimaryfont, 15),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () async {
                  SharedPreferences pref =
                      await SharedPreferences.getInstance();
                  pref.setString('key', 'true');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return Login();
                      },
                    ),
                    (r) => false,
                  );
                },
                child: Container(
                  height: Platform.isIOS ? 70 : 60,
                  color: kPrimarycolor,
                  alignment: Alignment.center,
                  child: Text(
                    "GET STARTED",
                    style: Textt2.textStyle(Colors.white, 15),
                  ),
                ),
              ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  String imagePath, title, desc, imageLine;

  SlideTile({this.imagePath, this.title, this.desc, this.imageLine});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 100,
          ),
          Container(
            height: 400,
            child: Image.asset(imagePath),
          ),
          // SizedBox(height: 15,),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Textt2.textStyle(kPrimaryfont, 26),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 280,
            child: Text(
              desc,
              textAlign: TextAlign.center,
              style: Textt1.textStyle(kSecondaryfont, 15),
            ),
          ),
          SizedBox(
            height: 70,
          ),

          Container(
            height: 10,
            child: Image.asset(imageLine),
          ),
        ],
      ),
    );
  }
}
