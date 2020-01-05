import 'package:flutter/material.dart';
import 'package:metalang/module_io/note_node.dart';

class NoteNodeWidget {
  final NoteNode noteNode;

  NoteNodeWidget({this.noteNode});

  List<Widget> getListItems(BuildContext context) {
    return [
      FlatButton(
        child: Text(noteNode.getName()),
        onPressed: () {},
      )
    ];
  }
}
