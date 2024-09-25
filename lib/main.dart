import 'package:flutter/material.dart';
import 'package:notes_app/Theme/theme.dart';
import 'package:notes_app/screens/notes_app.dart';

void main() {
  runApp(
    MaterialApp(
      theme: lightTheme,
      home: const NotesApp(),
    ),
  );
}
