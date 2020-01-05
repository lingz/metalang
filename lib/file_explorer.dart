import 'package:flutter/material.dart';
import 'package:metalang/module_io/directory_node.dart';
import 'package:metalang/ui/file_explorer/directory_node_widget.dart';
import 'package:path_provider/path_provider.dart';

class FileExplorer extends StatefulWidget {
  @override
  FileExplorerState createState() => FileExplorerState();
}

class FileExplorerState extends State<FileExplorer> {
  DirectoryNode rootDirectory;

  FileExplorerState() {
    _requestAppDocumentsDirectory();
  }

  void _requestAppDocumentsDirectory() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      rootDirectory = DirectoryNode(directory: directory);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: DirectoryNodeWidget(
      directoryNode: rootDirectory,
    ).getListItems(context));
  }
}
