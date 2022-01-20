import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RichTextHashTag extends StatefulWidget {
  static const String id = 'rich_text_hash_tag';

  const RichTextHashTag({Key? key}) : super(key: key);

  @override
  _RichTextHashTagState createState() => _RichTextHashTagState();
}

class _RichTextHashTagState extends State<RichTextHashTag> {
  String newText = "sasdsfd # sadfgdh asdgfhf #sd ghjsdgf egr";
  List _list = [];

  _splitText(){
    _list = newText.split(" ");
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splitText();
  }

  void fireToast(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: RichText(
            text: TextSpan(
              text: "",
              style: TextStyle(color: Colors.black, fontSize: 20),
              children: List.generate(
                _list.length,
                (index) {
                  return _list[index][0]=="#" && _list[index].length>1
                      ? TextSpan(
                          text: _list[index]+ " ",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              fireToast("Hash tag ${_list[index]}");
                            },
                        )
                      : TextSpan(
                          text: _list[index]+" ",
                          style: TextStyle(color: Colors.black),
                        );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

