import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class Errors extends StatefulWidget {
  const Errors({Key key}) : super(key: key);

  @override
  _ErrorsState createState() => _ErrorsState();
}

class _ErrorsState extends State<Errors> {
  final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
  final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kPrimaryfont,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Errors',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ExpansionTileCard(
                animateTrailing: true,
                trailing: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
                initialPadding: EdgeInsets.only(right: 50.0),
                title: Text('Year 2021',style: Textt2.textStyle(kPrimaryfont, 15),),
                children: <Widget>[

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Jan',style: Textt2.textStyle(kPrimaryfont, 12.0),),
                                Text('2021',style: Textt2.textStyle(kPrimaryfont, 12.0),),

                              ],
                            ),
                            SizedBox(width: 5.0,),
                            Expanded(
                              child: ExpansionTileCard(title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('FGS6391-KLJ',style: Textt1.textStyle(Colors.red, 14),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffFFE8E8),
                                expandedColor:  Color(0xffFFE8E8),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(right: 12.0,left: 12),
                                subtitle: Text('Tyre Breakdown',style: Textt1.textStyle(kPrimaryfont, 14.0),),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Description',style: Textt1.textStyle(kPrimaryfont, 15.0),),
                                        Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim '
                                            'velit mollit. Exercitation veniam consequat sunt nostrud amet.',style: Textt1.textStyle(Colors.grey, 12.0),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Feb',style: Textt2.textStyle(kPrimaryfont, 12.0),),
                                Text('2021',style: Textt2.textStyle(kPrimaryfont, 12.0),),

                              ],
                            ),
                            SizedBox(width: 5.0,),
                            Expanded(
                              child: ExpansionTileCard(title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('FGS6391-KLJ',style: Textt1.textStyle(Colors.red, 14),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffFFE8E8),
                                expandedColor:  Color(0xffFFE8E8),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(right: 12.0,left: 12),
                                subtitle: Text('Engine Heatup',style: Textt1.textStyle(kPrimaryfont, 14.0),),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Description',style: Textt1.textStyle(kPrimaryfont, 15.0),),
                                        Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim '
                                            'velit mollit. Exercitation veniam consequat sunt nostrud amet.',style: Textt1.textStyle(Colors.grey, 12.0),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('Mar',style: Textt2.textStyle(kPrimaryfont, 12.0),),
                                Text('2021',style: Textt2.textStyle(kPrimaryfont, 12.0),),

                              ],
                            ),
                            SizedBox(width: 5.0,),
                            Expanded(
                              child: ExpansionTileCard(title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('FGS6391-KLJ',style: Textt1.textStyle(Colors.red, 14),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffFFE8E8),
                                expandedColor:  Color(0xffFFE8E8),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(right: 12.0,left: 12),
                                subtitle: Text('Coolant leak from shaft',style: Textt1.textStyle(kPrimaryfont, 14.0),),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Description',style: Textt1.textStyle(kPrimaryfont, 15.0),),
                                        Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim '
                                            'velit mollit. Exercitation veniam consequat sunt nostrud amet.',style: Textt1.textStyle(Colors.grey, 12.0),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('April',style: Textt2.textStyle(kPrimaryfont, 12.0),),
                                Text('2021',style: Textt2.textStyle(kPrimaryfont, 12.0),),

                              ],
                            ),
                            SizedBox(width: 5.0,),
                            Expanded(
                              child: ExpansionTileCard(title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('FGS6391-KLJ',style: Textt1.textStyle(Colors.red, 14),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffFFE8E8),
                                expandedColor:  Color(0xffFFE8E8),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(right: 12.0,left: 12),
                                subtitle: Text('Steering wheel issue',style: Textt1.textStyle(kPrimaryfont, 14.0),),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Description',style: Textt1.textStyle(kPrimaryfont, 15.0),),
                                        Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim '
                                            'velit mollit. Exercitation veniam consequat sunt nostrud amet.',style: Textt1.textStyle(Colors.grey, 12.0),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('May',style: Textt2.textStyle(kPrimaryfont, 12.0),),
                                Text('2021',style: Textt2.textStyle(kPrimaryfont, 12.0),),

                              ],
                            ),
                            SizedBox(width: 5.0,),
                            Expanded(
                              child: ExpansionTileCard(title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('FGS6391-KLJ',style: Textt1.textStyle(Colors.red, 14),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffFFE8E8),
                                expandedColor:  Color(0xffFFE8E8),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(right: 12.0,left: 12),
                                subtitle: Text('Gearbox lightning issue',style: Textt1.textStyle(kPrimaryfont, 14.0),),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 25.0),
                                  child: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Description',style: Textt1.textStyle(kPrimaryfont, 15.0),),
                                        Text('Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim '
                                            'velit mollit. Exercitation veniam consequat sunt nostrud amet.',style: Textt1.textStyle(Colors.grey, 12.0),),

                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(height: 30,),

                      ],
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
