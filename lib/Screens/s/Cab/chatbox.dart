
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:chat_bubbles/bubbles/bubble_special_one.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qwikio_driver/Res/Constant.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';


class ChatBox extends StatefulWidget {
  static String id = 'chatbox';

  const ChatBox({Key key}) : super(key: key);

  @override
  _ChatBoxState createState() => _ChatBoxState();
}

class _ChatBoxState extends State<ChatBox> {
  final TextEditingController _controller = TextEditingController();
  bool emojiShowing = false;

  _onEmojiSelected(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.skipLast(1).toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  Duration duration = new Duration();
  Duration position = new Duration();
  bool isPlaying = false;
  bool isLoading = false;
  bool isPause = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF9F9F9),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/man.jpg'),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Arthur Douglas",
                          style: Textt2.textStyle(kPrimaryfont, 14.0)),
                      Text("Typing",
                          style: Textt2.textStyle(Colors.grey, 12.0)),
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40.0),
                      color: Colors.blue),
                  child: Icon(Icons.phone, color: Colors.white),
                ),
                Icon(
                  FontAwesomeIcons.ellipsisV,
                  color: kPrimarycolor,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  DateChip(
                    date: new DateTime(2021, 9, 6),
                    color: Color(0x558AD3D5),
                  ),

                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    color: Color(0xFFE8E8EE),
                    isSender: false,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  DateChip(
                    date: DateTime.now(),

                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    isSender: true,
                    color: Color(0xFF1B97F3),

                    sent: true,
                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    color: Color(0xFFE8E8EE),
                    isSender: false,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  DateChip(
                    date: DateTime.now(),

                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    isSender: true,
                    color: Color(0xFF1B97F3),

                    sent: true,
                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    color: Color(0xFFE8E8EE),
                    isSender: false,
                    textStyle: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  DateChip(
                    date: DateTime.now(),

                  ),
                  BubbleSpecialTwo(
                    text: 'bubble special tow with tail',
                    isSender: true,
                    color: Color(0xFF1B97F3),

                    sent: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 110,),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[

                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Colors.black12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15.0),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  emojiShowing = !emojiShowing;
                                });
                              },
                              icon: const Icon(
                                Icons.emoji_emotions,
                                color: Colors.orangeAccent,
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                controller: _controller,
                                decoration: InputDecoration(
                                  hintText: "Type a Message",
                                  hintStyle: TextStyle(color: Colors.black54),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.mic,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 8,),
                            Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send_outlined,
                      color: kPrimarycolor,
                      size: 30,
                    ),
                    elevation: 0,
                  ),
                ],
              ),
            ),
            Offstage(
              offstage: !emojiShowing,
              child: SizedBox(
                height: 250,
                child: EmojiPicker(
                    onEmojiSelected: (Category category, Emoji emoji) {
                      _onEmojiSelected(emoji);
                    },
                    onBackspacePressed: _onBackspacePressed,
                    config: Config(
                        columns: 7,
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 32 ,
                        verticalSpacing: 0,
                        horizontalSpacing: 0,
                        initCategory: Category.RECENT,
                        bgColor: const Color(0xFFF2F2F2),
                        indicatorColor: Colors.blue,
                        iconColor: Colors.grey,
                        iconColorSelected: Colors.blue,
                        progressIndicatorColor: Colors.blue,
                        backspaceColor: Colors.blue,
                        showRecentsTab: true,
                        recentsLimit: 28,
                        noRecentsText: 'No Recents',
                        noRecentsStyle: const TextStyle(
                            fontSize: 20, color: Colors.black26),
                        tabIndicatorAnimDuration: kTabScrollDuration,
                        categoryIcons: const CategoryIcons(),
                        buttonMode: ButtonMode.MATERIAL)),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
