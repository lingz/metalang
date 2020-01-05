import 'package:flutter/material.dart';
import 'package:metalang/module_io/directory_node.dart';
import 'package:metalang/module_io/note_node.dart';
import 'package:metalang/ui/file_explorer/note_node_widget.dart';

class DirectoryNodeWidget {
  final DirectoryNode directoryNode;

  DirectoryNodeWidget({this.directoryNode});

  List<Widget> getListItems(BuildContext context) {
    if (this.directoryNode == null) {
      return [Text("Loading...")];
    }
    final childNodes = directoryNode.getChildren();

    final childDirectoryWidgets = childNodes
        .where((child) => child is DirectoryNode)
        .map((childDirectory) =>
            DirectoryNodeWidget(directoryNode: childDirectory))
        .expand(
            (directoryNodeWidget) => directoryNodeWidget.getListItems(context));

    final childNoteWidgets = childNodes
        .where((child) => child is NoteNode)
        .map((childNote) => NoteNodeWidget(noteNode: childNote))
        .expand((childNoteWidget) => childNoteWidget.getListItems(context));
    return [
      FlatButton(
        child: Text(directoryNode.getName()),
        onPressed: () {},
      ),
      FlatButton(
        child: Text('New Note / Folder'),
        onPressed: () {},
      ),
      ...childDirectoryWidgets,
      ...childNoteWidgets,
    ];
  }
}
