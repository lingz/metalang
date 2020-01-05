import 'package:flutter/material.dart';

class TextEditor extends StatefulWidget {
  @override
  TextEditorState createState() => TextEditorState();
}

class TextEditorState extends State<TextEditor> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: (String value) async {},
    );
  }
}
