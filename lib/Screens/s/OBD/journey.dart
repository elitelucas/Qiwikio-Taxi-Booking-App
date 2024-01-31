import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class Journey extends StatefulWidget {
  const Journey({Key key}) : super(key: key);

  @override
  _JourneyState createState() => _JourneyState();
}

class _JourneyState extends State<Journey> {
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
          'Journey',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
          child: Column(
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
                                  Text('You drove 24321 miles in 69:42:32',style: Textt1.textStyle(kPrimaryfont, 10),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffE8F5FF),
                                expandedColor:  Color(0xffE8F5FF),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(left: 12),
                                trailing: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
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
                                  Text('You drove 24321 miles in 69:42:32',style: Textt1.textStyle(kPrimaryfont, 10),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffE8F5FF),
                                expandedColor:  Color(0xffE8F5FF),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(left: 12),
                                trailing: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
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
                                  Text('You drove 24321 miles in 69:42:32',style: Textt1.textStyle(kPrimaryfont, 10),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffE8F5FF),
                                expandedColor:  Color(0xffE8F5FF),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(left: 12),
                                trailing: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
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
                                  Text('You drove 24321 miles in 69:42:32',style: Textt1.textStyle(kPrimaryfont, 10),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffE8F5FF),
                                expandedColor:  Color(0xffE8F5FF),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(left: 12),
                                trailing: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
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
                                  Text('You drove 24321 miles in 69:42:32',style: Textt1.textStyle(kPrimaryfont, 10),),
                                  Image.asset('assets/icons/doc.png',height: 20,),

                                ],
                              ),
                                baseColor: Color(0xffE8F5FF),
                                expandedColor:  Color(0xffE8F5FF),
                                animateTrailing: true,
                                contentPadding: EdgeInsets.only(left: 12),
                                trailing: Icon(Icons.keyboard_arrow_down,size: 30,color: kPrimaryfont,),
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
                        Container(height: 40,)

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
