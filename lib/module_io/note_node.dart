import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:metalang/module_io/io_node.dart';
import 'package:metalang/module_note/note.dart';

class NoteNode extends IONode {
  final File file;

  NoteNode({this.file});

  @override
  String getName() {
    return p.basenameWithoutExtension(file.path);
  }

  Future<Note> getNote() async {
    String rawContents = await file.readAsString();
    return Note(raw: rawContents);
  }
}
