import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ReadWrite extends StatefulWidget {
  @override
  _ReadWriteState createState() => _ReadWriteState();
}

class _ReadWriteState extends State<ReadWrite> {
  // This will be displayed on the screen
  String? _content;

  // Find the Documents path
  Future<String> _getDirPath() async {
    final _dir = await getApplicationDocumentsDirectory();
    return _dir.path;
  }

  // This function is triggered when the "Read" button is pressed
  Future<void> _readData() async {
    final _dirPath = await _getDirPath();
    final _myFile = File('$_dirPath/data.txt');
    final _data = await _myFile.readAsString(encoding: utf8);
    setState(() {
      _content = _data;
    });
  }

  // TextField controller
  final _textController = TextEditingController();
  // This function is triggered when the "Write" buttion is pressed
  Future<void> _writeData() async {
    final _dirPath = await _getDirPath();

    final _myFile = File('$_dirPath/data.txt');
    // If data.txt doesn't exist, it will be created automatically

    await _myFile.writeAsString(_textController.text);
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read and Write file'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter your name'),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                onPressed: _writeData,
                child: Text(
                  'Save to file',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: _content != null
                  ? Text(_content!, style: TextStyle(fontSize: 30))
                  : Text(
                      'Press the button to load your name',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                onPressed: _readData,
                child: Text(
                  'Read the file',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
