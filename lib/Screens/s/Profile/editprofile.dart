import 'package:flutter/material.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
              Stack(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundImage:  AssetImage(
                        'assets/images/man.png',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 2.0,
                    right: 110.0,
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: IconButton(icon: Icon(Icons.camera_alt), onPressed: (){})),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Full Name',
                    style: Textt2.textStyle(Colors.grey, 15.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'Murphy Shaun',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15)),
                  ),
                  Text(
                    'From',
                    style: Textt2.textStyle(Colors.grey, 15.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'United Kingdom',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15)),
                  ),
                  Text(
                    'Total Experience',
                    style: Textt2.textStyle(Colors.grey, 15.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: '3.5 Years',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15)),
                  ),
                  Text(
                    'Total Rides',
                    style: Textt2.textStyle(Colors.grey, 15.0),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: '52',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: AuthButton(
                  colorr: kPrimarycolor,
                  textt: 'Update Profile',
                  textStyle: Textt1.textStyle(Colors.white, 15.0),
                  onchanged: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
