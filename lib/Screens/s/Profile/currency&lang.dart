import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dialog.dart';
import 'package:language_picker/languages.dart';
import 'package:qwikio_driver/Components/authbutton.dart';
import 'package:qwikio_driver/Res/Constant.dart';

class CurrencyLang extends StatefulWidget {
   CurrencyLang({this.title});
   final String title;

  @override
  _CurrencyLangState createState() => _CurrencyLangState();
}
TextEditingController _currencycontroller= TextEditingController();

class _CurrencyLangState extends State<CurrencyLang> {

  Language _selectedDialogLanguage = Languages.urdu;


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
          'Currency and language',
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
                height: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Prefered currency',
                      style: Textt2.textStyle(Colors.grey, 15.0),),
                    TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      onTap: (){
                        _cureencypicker(context);
                      },

                      controller: _currencycontroller,
                      decoration: InputDecoration(
                          hintText: 'USD',
                          hintStyle: Textt1.textStyle(kPrimaryfont, 15),
                      ),
                    ),

                    Text('Prefered language',
                      style: Textt2.textStyle(Colors.grey, 15.0),),
                    TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      onTap: (){
                        _openLanguagePickerDialog();
                      },

                      controller: _currencycontroller,
                      decoration: InputDecoration(
                        hintText: 'English',
                        hintStyle: Textt1.textStyle(kPrimaryfont, 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 530,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AuthButton(colorr: kPrimarycolor,
                      textt: 'Save',textStyle: Textt1.textStyle(Colors.white, 15),
                      onchanged: (){

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
  _cureencypicker(BuildContext context) async {
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) {
        _currencycontroller;
        print('Select currency: ${currency.name}');
      },
      favorite: ['PKR'],
    );
  }


  void _openLanguagePickerDialog() => showDialog(
    context: context,
    builder: (context) => Theme(
        data: Theme.of(context).copyWith(primaryColor: Colors.pink),
        child: LanguagePickerDialog(
            titlePadding: EdgeInsets.all(8.0),
            searchCursorColor: Colors.pinkAccent,
            searchInputDecoration: InputDecoration(hintText: 'Search...'),
            isSearchable: true,
            title: Text('Select your language'),
            onValuePicked: (Language language) => setState(() {
              _selectedDialogLanguage = language;
              print(_selectedDialogLanguage.name);
              print(_selectedDialogLanguage.isoCode);
            }),
            itemBuilder: _buildDialogItem)),
  );

  Widget _buildDialogItem(Language language) => Row(
    children: <Widget>[
      Text(language.name),
      SizedBox(width: 8.0),
      Flexible(child: Text("(${language.isoCode})"))
    ],
  );
  }


class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}