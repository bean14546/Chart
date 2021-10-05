import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesListScreen extends StatefulWidget {
  @override
  _NotesListScreenState createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  String? noteValue;

  @override
  void initState(){
    super.initState();
    getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes List Screen'),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Center(
            child: noteValue == null ? Text('No Notes Available') : Text(noteValue! ,style: TextStyle(fontSize: 30),),
          ),
          SizedBox(height: 50),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: FlatButton(
              child: Text(
                'Back To Shared Preferences',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void getNotes() async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    noteValue = pref.getString('noteData');
    setState(() {

    });
  }
}
