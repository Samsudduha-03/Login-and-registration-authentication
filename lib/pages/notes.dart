import 'package:flutter/material.dart';

import '../db/notes_db.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final _notesController = TextEditingController();

  void addNewNotes() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add new note"),
        content: TextField(controller: _notesController),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _notesController.clear();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              try {
                await NotesDb().insertNote(_notesController.text);
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Insertion Successful")),
                  );
                  Navigator.pop(context);
                  _notesController.clear();
                  return;
                }
              } catch (e) {
                {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("Error:$e")));
                }
              }
            },
            child: Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("Notes Page")),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addNewNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
