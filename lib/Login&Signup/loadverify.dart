import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:qwikio_driver/Screens/s/Truck%20Driver/truckdriver.dart';

class LoadVerify extends StatefulWidget {
  static String id = 'loadverify';

  @override
  LoadVerifyState createState() => new LoadVerifyState();
}

class LoadVerifyState extends State<LoadVerify> {

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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Heavy load verification',
          style: Textt2.textStyle(kPrimaryfont, 18.0),
        ),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: kPrimaryfont,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: Color(0xffFDFDFD),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Please upload the relevant ',
                style: Textt1.textStyle(kPrimaryfont, 15),
              ),
              Text(
                'documents confirming you can carry',
                style: Textt1.textStyle(kPrimaryfont, 15),
              ),
              Text(
                ' heavy load',
                style: Textt1.textStyle(kPrimaryfont, 15),
              ),
              SizedBox(
                height: 60.0,
              ),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: [5.0],
                color: Colors.lightBlue,
                radius: Radius.circular(12.0),
                padding: EdgeInsets.all(6),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  child: Container(
                    height: 90,
                    width: 330,
                    child: InkWell(
                     onTap: (){
                       _openFileExplorer();
                     },
                      child: Center(
                        child: Text(
                          'Upload documents',
                          style: Textt1.textStyle(kPrimarycolor, 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Container(
                height: 70,
                width: 330,
                child: new Builder(
                  builder: (BuildContext context) => isLoadingPath ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const CircularProgressIndicator()
                  )
                      : path != null || paths != null ? new Container(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: new Scrollbar(
                        child: new ListView.separated(
                          itemCount: paths != null && paths.isNotEmpty ? paths.length : 1,
                          itemBuilder: (BuildContext context, int index) {
                            final bool isMultiPath = paths != null && paths.isNotEmpty;
                            final int fileNo = index + 1;
                            final String name = 'File $fileNo : ' +
                                (isMultiPath ? paths.keys.toList()[index] : fileName ?? '...');
                            final filePath = isMultiPath
                                ? paths.values.toList()[index].toString() : path;
                            return new ListTile(title: new Text(name,),
                              subtitle: new Text(filePath),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) => new Divider(),
                        )),
                  )
                      : new Container(),
                ),
              ),

              SizedBox(
                height: 80.0,
              ),
              AuthButton(
                colorr: kPrimarycolor,
                textt: 'Next',
                textStyle: Textt1.textStyle(Colors.white, 15.0),
                onchanged: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Truckdriver()),);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
