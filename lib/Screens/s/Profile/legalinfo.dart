import 'package:flutter/material.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class LegalInfo extends StatefulWidget {
  const LegalInfo({Key key}) : super(key: key);

  @override
  _LegalInfoState createState() => _LegalInfoState();
}

class _LegalInfoState extends State<LegalInfo> {
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
          'Legal info',
          style: Textt2.textStyle(kPrimaryfont, 18.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Color(0xffDDDDDD)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        width: 165,
                        height: 50,
                        decoration: BoxDecoration(
                            color: kPrimarycolor,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            'Privacy Policy',
                            style: Textt1.textStyle(Colors.white, 15.0),
                          ),
                        ),
                      ),
                      Container(
                          width: 165,
                          height: 50,
                          child: Center(
                              child: Text(
                                'Term of Use',
                                style: Textt1.textStyle(Colors.grey, 15.0),
                              ))),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('1. General',style: Textt2.textStyle(kPrimaryfont, 16.0),),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis et lectus ac gravida. Aliquam id augue'
                      ' urna. Pellentesque ''eros leo, euismod vel tristique in, tincidunt sed nibh. Praesent condimentum a nulla in imperdiet.',
                    style: Textt2.textStyle(Colors.grey, 14.0),
                  ),
                  SizedBox(height: 20,),
                  Text('2. Personal information',style: Textt2.textStyle(kPrimaryfont, 16.0),),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis et lectus ac gravida. Aliquam id augue'
                      ' urna. Pellentesque ''eros leo, euismod vel tristique in, tincidunt sed nibh. Praesent condimentum a nulla in imperdiet.',
                    style: Textt2.textStyle(Colors.grey, 14.0),
                  ),
                  SizedBox(height: 20,),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis et lectus ac gravida. Aliquam id augue'
                      ' urna. Pellentesque ''eros leo, euismod vel tristique in, tincidunt sed nibh. Praesent condimentum a nulla in imperdiet.',
                    style: Textt2.textStyle(Colors.grey, 14.0),
                  ),
                  SizedBox(height: 20,),
                  Text('3. Legal',style: Textt2.textStyle(kPrimaryfont, 16.0),),
                  Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum venenatis et lectus ac gravida. Aliquam id augue'
                      ' urna. Pellentesque ''eros leo, euismod vel tristique in, tincidunt sed nibh. Praesent condimentum a nulla in imperdiet.',
                    style: Textt2.textStyle(Colors.grey, 14.0),
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
