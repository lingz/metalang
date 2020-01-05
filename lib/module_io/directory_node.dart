import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:metalang/module_io/note_node.dart';
import 'package:metalang/module_io/io_node.dart';

class DirectoryNode extends IONode {
  final Directory directory;

  DirectoryNode({this.directory});

  @override
  String getName() {
    return p.basename(directory.path);
  }

  List<IONode> getChildren() {
    final allEntities = directory
        .listSync()
        .where((child) => child is Directory || child is File)
        .map((child) => child is Directory
            ? DirectoryNode(directory: child)
            : NoteNode(file: child))
        .toList();

    return allEntities;
  }

  DirectoryNode createChildDirectory(String name) {
    final newPath = p.join(directory.path, name);
    final newDirectory = Directory(newPath);

    newDirectory.createSync();

    return DirectoryNode(directory: newDirectory);
  }

  NoteNode createChildNote(String name) {
    final newPath = p.join(directory.path, name + ".txt");
    final newNoteFile = File(newPath);

    newNoteFile.createSync();

    return NoteNode(file: newNoteFile);
  }
}
