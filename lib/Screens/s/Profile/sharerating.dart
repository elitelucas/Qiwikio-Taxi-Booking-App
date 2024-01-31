import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class ShareRating extends StatefulWidget {
  ShareRating({this.title});
  final String title;

  @override
  _ShareRatingState createState() => _ShareRatingState();
}

class _ShareRatingState extends State< ShareRating> {

  String fileName;
  String path;
  Map<String, String> paths;
  List<String> extensions;
  bool isLoadingPath = false;
  bool isMultiPick = false;
  FileType fileType;

  void _openFileExplorer() async {
    setState(() => isLoadingPath = true);
    try {


      path = await FilePicker.getFilePath(type: fileType= FileType.any, allowedExtensions: extensions);
      paths = null;

    }
    on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      isLoadingPath = false;
      fileName = path != null ? path.split('/').last : paths != null
          ? paths.keys.toString() : '...';
    });
  }

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
          'Share your ratings',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Numbers of trips',
                      style: Textt1.textStyle(Colors.grey, 15.0),),
                    TextField(
                      onTap: (){
                      },

                      decoration: InputDecoration(
                        hintText: '23',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15),
                      ),
                    ),

                    Text('Platform',
                      style: Textt1.textStyle(Colors.grey, 15.0),),
                    TextField(
                      onTap: (){
                      },

                      decoration: InputDecoration(
                        hintText: 'Uber',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15),
                      ),
                    ),
                    Text('Upload ratings document',
                      style: Textt1.textStyle(Colors.grey, 15.0),),
                    Container(
                      height: 90,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                child: Text(
                                  'Back Side',
                                  style: Textt1.textStyle(Colors.grey, 15.0),
                                ),
                              )),
                          Expanded(
                              flex: 3,
                              child: InkWell(
                                onTap: (){
                                  _openFileExplorer();

                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Done',
                                        style: Textt1.textStyle(kPrimaryfont, 15.0),
                                      ),
                                      SizedBox(width: 10,),
                                      Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.circular(30.0),
                                        ),
                                        child: Icon(Icons.check,color: Colors.white,),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
              Container(
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AuthButton(colorr: kPrimarycolor,
                      textt: 'Submit',textStyle: Textt1.textStyle(Colors.white, 15),
                      onchanged: (){
                      _congo();
                      },
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    ) ;
  }
  _congo() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            title: Stack(
              children: [
                Container(
                  height: 150,
                  child: Image.asset(
                    'assets/images/congo.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    right: 2.0,
                    child: IconButton(
                        icon: Icon(FontAwesome.cancel, color: Colors.grey),
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            ),
            content: Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Thank You!',
                    style: Textt2.textStyle(kPrimaryfont, 15.0),
                  ),
                  Text(
                    'Our representative will verify and update',
                    style: Textt1.textStyle(kPrimaryfont, 12.0),
                  ),
                  Text(
                    'your ratings',
                    style: Textt1.textStyle(kPrimaryfont, 12.0),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      focusElevation: 10,
                      highlightElevation: 10,
                      hoverElevation: 10,
                      color: kPrimarycolor,
                      elevation: 4,
                      child: SizedBox(
                        width: 265,
                        height: 55,
                        child: Center(
                            child: Text(
                              'Done',
                              style: Textt1.textStyle(Colors.white, 15),
                              textAlign: TextAlign.center,
                            )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 10,),
            ],
          );
        });
  }


}

