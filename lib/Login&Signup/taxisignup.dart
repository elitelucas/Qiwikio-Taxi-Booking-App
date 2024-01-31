import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Components/textfieldd.dart';
import 'package:qwikio_driver/Login&Signup/pincode.dart';

class TaxiSignup extends StatefulWidget {
  static String id = "taxisignup";

  const TaxiSignup({Key key}) : super(key: key);

  @override
  _TaxiSignupState createState() => _TaxiSignupState();
}

class _TaxiSignupState extends State<TaxiSignup> {
  bool _obscureText = true;
  bool loginVal = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 340.0,
                height: 250.0,
                // color: Colors.brown,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFieldd(
                      hinttextt: 'Enter your user Id',
                      labeltextt: 'User Id',
                      obscre: false,
                    ),
                    TextFieldd(
                      hinttextt: 'Enter your mobile no',
                      labeltextt: 'Mobile No',
                      code: CountryCodePicker(
                        initialSelection: 'US',
                        showCountryOnly: false,
                        favorite: ['+1','US','+92','PAK'],
                      ),
                      keyboardType: TextInputType.number,
                      obscre: false,
                    ),
                    TextFieldd(
                      hinttextt: 'Enter your Password',
                      labeltextt: 'Password',
                      obscre: _obscureText,
                      iconn: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          checkColor: kPrimarycolor,
                          activeColor: Colors.grey,
                          value: loginVal,
                          onChanged: (bool value) {
                            setState(() {
                              loginVal = value;
                            });
                          },
                        ),
                        Text(
                          'Kepp me signed in',
                          style: Textt1.textStyle(Colors.grey, 15.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              AuthButton(
                onchanged: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PinCodeVerificationScreen("+8801376221100")),);
                },
                textt: 'Next',
                textStyle: Textt1.textStyle(Colors.white, 18.0),
                colorr: kPrimarycolor,
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      height: 2,
                      width: 110,
                      color: Colors.grey,
                    ),

                    Text(
                      'Or continue with',
                      style: Textt1.textStyle(Colors.grey, 15),
                    ),

                    Container(
                      height: 2,
                      width: 110,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12.0,),
              Container(
                width: 360,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        child: Image.asset(
                          'assets/icons/google.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 65,
                        child: Image.asset(
                          'assets/icons/fb.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Container(
                width: 180,
                child: Divider(
                  thickness: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
