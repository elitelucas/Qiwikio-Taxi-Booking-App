import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Profile/editprofile.dart';

class MyProfile extends StatefulWidget {
  static String id = "myprofile";

  const MyProfile({Key key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
          'My Profile',
          style: Textt2.textStyle(kPrimaryfont, 18.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      backgroundImage:  AssetImage(
                        'assets/images/man.png',
                      ),
                    ),
                    Text('Murphy Shaun',
                      style: Textt2.textStyle(kPrimaryfont, 22.0),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star,size: 15,color: kPrimarycolor,),
                        Text(' 4.2',
                          style: Textt2.textStyle(kPrimaryfont, 15.0),),
                        Text(' (47)',
                          style: Textt2.textStyle(Colors.grey, 15.0),),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 10,),
              Divider(thickness: 1,),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesome.location,color: Colors.red,),
                      Text('  From',
                        style: Textt2.textStyle(Colors.grey, 15.0),),
                    ],

                  ),
                  Text('United Kingdom',
                    style: Textt1.textStyle(kPrimaryfont, 15.0),),
                ],

              ),
              SizedBox(height: 10,),
              Divider(thickness: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesome.clock,color: Colors.blue,),
                      Text('  Member since',
                        style: Textt2.textStyle(Colors.grey, 15.0),),
                    ],

                  ),
                  Text('Feb, 2019',
                    style: Textt1.textStyle(kPrimaryfont, 15.0),),
                ],

              ),
              SizedBox(height: 10,),
              Divider(thickness: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(FontAwesome.mobile,color: Colors.orangeAccent,),
                      Text('  Total Rides',
                        style: Textt2.textStyle(Colors.grey, 15.0),),
                    ],

                  ),
                  Text('52',
                    style: Textt1.textStyle(kPrimaryfont, 15.0),),
                ],

              ),
              SizedBox(height: 10,),
              Divider(thickness: 1,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('         Total Experience',
                        style: Textt2.textStyle(Colors.grey, 15.0),),
                    ],

                  ),
                  Text('3.5 Years',
                    style: Textt1.textStyle(kPrimaryfont, 15.0),),
                ],

              ),
              SizedBox(height: 10,),
              Divider(thickness: 1,),

              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: AuthButton(colorr: kPrimarycolor,
                textt: 'Edit profile',textStyle: Textt1.textStyle(Colors.white, 15.0),
                  onchanged: (){
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> EditProfile()));

                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
