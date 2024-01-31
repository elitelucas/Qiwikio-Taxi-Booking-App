import 'package:flutter/material.dart';
import 'package:qwikio_driver/Login&Signup/tablist.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Components/textfieldd.dart';
import 'package:qwikio_driver/Screens/s/Cab/caboffline.dart';

class Login extends StatefulWidget {
  static String id = "login";

  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool loginVal = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50),
              child: Container(
                height: 120,
                child: Center(
                  child: Image.asset(
                    "assets/icons/qwikio.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  'Welcome Back !',
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
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 340.0,
              height: 200.0,
              // color: Colors.brown,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldd(
                    hinttextt: 'Enter your Email',
                    labeltextt: 'Email',
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
                  Text(
                    'Forgot Password?',
                    style: Textt2.textStyle(kPrimarycolor, 15.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            AuthButton(
              onchanged: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CabOffline()),
                );
              },
              textt: 'Login',
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
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TabList()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You don\'t have an account? ',
                    style: Textt2.textStyle(kPrimaryfont, 15),
                  ),
                  Text(
                    'Sign Up',
                    style: Textt2.textStyle(kPrimarycolor, 15),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
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
    );
  }
}
