import 'package:flutter/material.dart';
import 'package:notes_app/data/temporary_data.dart';
import 'package:notes_app/screens/add_note.dart';
import 'package:notes_app/screens/edit_note.dart';
import 'package:notes_app/screens/view_note.dart';
import 'package:notes_app/widgets/notes_list.dart';

import '../model/note.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});

  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  void _openNewNote(BuildContext context) async {
    final newNote = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddNote(),
      ),
    );
    if (newNote == null) {
      return;
    }
    setState(() {
      notes.add(newNote);
    });
  }

  void _openViewNote(BuildContext context, Note note) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ViewNote(note: note)));
  }

  void _deleteNote(Note note) {
    setState(() {
      notes.remove(note);
    });
  }

  void _editNote(Note note, int index) async {
    Map<String, dynamic> editedNote = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => EditNote(
          note: note,
          index: index,
        ),
      ),
    );
    setState(() {
      notes[editedNote['index']] = editedNote['editedNote'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Notes App",
        ),
        actions: [
          IconButton(
            onPressed: () {
              _openNewNote(context);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: NotesList(
        onClickNote: _openViewNote,
        onClickDelete: (Note note) {
          _deleteNote(note);
        },
        onClickEdit: (Note note, int index) {
          _editNote(note, index);
        },
        notes: notes,
      ),
    );
  }
}
