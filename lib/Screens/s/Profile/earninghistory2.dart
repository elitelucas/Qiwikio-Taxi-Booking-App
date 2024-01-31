import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Profile/earninghistory.dart';
import 'package:qwikio_driver/Screens/s/Profile/earninghistory3.dart';



class EarningHistory2 extends StatefulWidget {
  const  EarningHistory2({Key key}) : super(key: key);

  @override
  _EarningHistory2State createState() => _EarningHistory2State();
}

class _EarningHistory2State extends State< EarningHistory2> {



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
          'Earning history',
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
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              width: 350,
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(color: Color(0xffDDDDDD)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> EarningHistory()));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(child: Text('Day',style: Textt1.textStyle(kPrimaryfont, 15.0),),),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                        color: kPrimarycolor,
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    child: Center(child: Text('Week',style: Textt1.textStyle(Colors.white, 15.0),),),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder:(context)=> EarningHistory3()));
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Center(child: Text('Month',style: Textt1.textStyle(kPrimaryfont, 15.0),),),
                    ),
                  ),

                ],),
            ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                height: 280,
                decoration: BoxDecoration(
                  color: Color(0xffF7FAFC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "20 July 2021",
                          style: Textt2.textStyle(
                              kPrimaryfont, 15),
                        ),

                        Text(
                          "\$500.00",
                          style: Textt2.textStyle(
                              Colors.green, 15),
                        ),
                      ],),
                    SizedBox(height: 15,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/ride.png',height: 35.0,),
                            Text('Trips',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('7',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/tran.png',height: 30.0,),
                            Text('   Hours',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('6 hours',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/tip.png',height: 35.0,),
                            Text('Trips',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('5',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                height: 280,
                decoration: BoxDecoration(
                  color: Color(0xffF7FAFC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "21 July 2021",
                          style: Textt2.textStyle(
                              kPrimaryfont, 15),
                        ),

                        Text(
                          "\$443.00",
                          style: Textt2.textStyle(
                              Colors.green, 15),
                        ),
                      ],),
                    SizedBox(height: 15,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/ride.png',height: 35.0,),
                            Text('Trips',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('3',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/tran.png',height: 30.0,),
                            Text('   Hours',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('3 hours',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/tip.png',height: 35.0,),
                            Text('Trips',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('2',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(15),
                height: 280,
                decoration: BoxDecoration(
                  color: Color(0xffF7FAFC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "22 July 2021",
                          style: Textt2.textStyle(
                              kPrimaryfont, 15),
                        ),

                        Text(
                          "\$941.00",
                          style: Textt2.textStyle(
                              Colors.green, 15),
                        ),
                      ],),
                    SizedBox(height: 15,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/ride.png',height: 35.0,),
                            Text('Trips',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('10',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/tran.png',height: 30.0,),
                            Text('   Hours',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('10 hours',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),

                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/icons/tip.png',height: 35.0,),
                            Text('Trips',style: Textt2.textStyle(kPrimaryfont, 15.0),),
                          ],
                        ),
                        Row(
                          children: [
                            Text('4',style: Textt2.textStyle(kPrimaryfont, 15.0),),

                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),
                  ],
                ),
              ),


          ],),
        ),
      ),
    );
  }
}
