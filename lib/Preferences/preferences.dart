import 'package:flutter/material.dart';
import 'notes_list_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Preferances extends StatefulWidget {
  const Preferances({Key? key}) : super(key: key);

  @override
  _PreferancesState createState() => _PreferancesState();
}

class _PreferancesState extends State<Preferances> {
  final notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: notesController,
              decoration: InputDecoration(hintText: 'Enter Notes'),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                onPressed: () {
                  setNotesData(notesController.text);
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),

            SizedBox(height: 20),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotesListScreen(),
                    ),
                  );
                },
                child: Text(
                  'View Notes',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(height: 80),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: FlatButton(
                child: Text(
                  'Back To Homepage',
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
      ),
    );
  }

  Future<void> setNotesData(noteValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('noteData', noteValue);
  }
}
