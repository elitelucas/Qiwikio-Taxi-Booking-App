import 'package:file_picker/file_picker.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';


class Documents extends StatefulWidget {
  const Documents({Key key, @required this.themeMode}) : super(key: key);
  final ValueChanged<ThemeMode> themeMode;
  @override
  _DocumentsState createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
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

   Color screenPickerColor; // Color for picker shown in Card on the screen.
   Color dialogPickerColor; // Color for picker in dialog using onChanged
   Color dialogSelectColor; // Color for picker using color select dialog.
   bool isDark;

  // Define some custom colors for the custom picker segment.
  // The 'guide' color values are from
  // https://material.io/design/color/the-color-system.html#color-theme-creation
  static const Color guidePrimary = Color(0xFF6200EE);
  static const Color guidePrimaryVariant = Color(0xFF3700B3);
  static const Color guideSecondary = Color(0xFF03DAC6);
  static const Color guideSecondaryVariant = Color(0xFF018786);
  static const Color guideError = Color(0xFFB00020);
  static const Color guideErrorDark = Color(0xFFCF6679);
  static const Color blueBlues = Color(0xFF174378);

  // Make a custom ColorSwatch to name map from the above custom colors.
  final Map<ColorSwatch<Object>, String> colorsNameMap =
  <ColorSwatch<Object>, String>{
    ColorTools.createPrimarySwatch(guidePrimary): 'Guide Purple',
    ColorTools.createPrimarySwatch(guidePrimaryVariant): 'Guide Purple Variant',
    ColorTools.createAccentSwatch(guideSecondary): 'Guide Teal',
    ColorTools.createAccentSwatch(guideSecondaryVariant): 'Guide Teal Variant',
    ColorTools.createPrimarySwatch(guideError): 'Guide Error',
    ColorTools.createPrimarySwatch(guideErrorDark): 'Guide Error Dark',
    ColorTools.createPrimarySwatch(blueBlues): 'Blue blues',
  };

  @override
  void initState() {
    screenPickerColor = Colors.blue;
    dialogPickerColor = Colors.red;
    dialogSelectColor = const Color(0xFFA239CA);
    isDark = false;
    super.initState();
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
          'Documents',
          style: Textt2.textStyle(kPrimaryfont, 16.0),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Driving License',style: Textt2.textStyle(kPrimaryfont, 15.0),),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Front Side',
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
                                'Upload',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  color: Color(0xffC4C4C4),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Icon(Icons.arrow_upward,color: Colors.white,),
                              ),
                            ],
                          ),
                        ),
                      )),
                  ],
                ),
              ),
              Divider(),
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
              Text('Vehicle',style: Textt2.textStyle(kPrimaryfont, 15.0),),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Vehicle Registration',
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
                                  'Upload',
                                  style: Textt1.textStyle(kPrimaryfont, 15.0),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xffC4C4C4),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Icon(Icons.arrow_upward,color: Colors.white,),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Vehicle Insurance',
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
                                  'Upload',
                                  style: Textt1.textStyle(kPrimaryfont, 15.0),
                                ),
                                SizedBox(width: 10,),
                                Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: Color(0xffC4C4C4),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Icon(Icons.arrow_upward,color: Colors.white,),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Car Model',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'BMW Series 5',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),

                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Car Maker',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'BMW',
                                style: Textt1.textStyle(kPrimaryfont, 15.0),
                              ),

                            ],
                          ),
                        )),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: 90,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Text(
                            'Car colour',
                            style: Textt1.textStyle(Colors.grey, 15.0),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child:
                        ListTile(
                          subtitle: Text(
                                '${ColorTools.nameThatColor(dialogPickerColor)}',
                          ),
                          trailing: ColorIndicator(
                            width: 30,
                            height: 30,
                            borderRadius: 22,
                            color: dialogPickerColor,
                            onSelectFocus: false,
                            onSelect: () async {
                              // Store current color before we open the dialog.
                              final Color colorBeforeDialog = dialogPickerColor;
                              // Wait for the picker to close, if dialog was dismissed,
                              // then restore the color we had before it was opened.
                              if (!(await colorPickerDialog())) {
                                setState(() {
                                  dialogPickerColor = colorBeforeDialog;
                                });
                              }
                            },
                          ),
                        ),                    ),
                  ],
                ),
              ),
              Divider(),

              SizedBox(height: 10,),
              Center(
                child: AuthButton(
                  colorr: kPrimarycolor,
                  textt: 'Upload Document',
                  textStyle: Textt1.textStyle(Colors.white, 15.0),
                  onchanged: () {},
                ),
              ),

              Container(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool> colorPickerDialog() async {
    return ColorPicker(
      color: dialogPickerColor,
      onColorChanged: (Color color) =>
          setState(() => dialogPickerColor = color),
      width: 40,
      height: 40,
      borderRadius: 4,
      spacing: 5,
      runSpacing: 5,
      wheelDiameter: 155,
      heading: Text(
        'Select color',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      subheading: Text(
        'Select color shade',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      wheelSubheading: Text(
        'Selected color and its shades',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      showMaterialName: true,
      showColorName: true,
      showColorCode: true,
      copyPasteBehavior: const ColorPickerCopyPasteBehavior(
        longPressMenu: true,
      ),
      materialNameTextStyle: Theme.of(context).textTheme.caption,
      colorNameTextStyle: Theme.of(context).textTheme.caption,
      colorCodeTextStyle: Theme.of(context).textTheme.bodyText2,
      colorCodePrefixStyle: Theme.of(context).textTheme.caption,
      selectedPickerTypeColor: Theme.of(context).colorScheme.primary,
      pickersEnabled: const <ColorPickerType, bool>{
        ColorPickerType.both: false,
        ColorPickerType.primary: true,
        ColorPickerType.accent: true,
        ColorPickerType.bw: false,
        ColorPickerType.custom: true,
        ColorPickerType.wheel: true,
      },
      customColorSwatchesAndNames: colorsNameMap,
    ).showPickerDialog(
      context,
      constraints:
      const BoxConstraints(minHeight: 480, minWidth: 300, maxWidth: 320),
    );
  }
}
