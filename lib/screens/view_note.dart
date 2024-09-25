import 'package:flutter/material.dart';
import 'package:notes_app/Theme/theme.dart';
import 'package:notes_app/model/note.dart';

class ViewNote extends StatelessWidget {
  const ViewNote({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          width: screenSize.width,
          child: Column(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (note.image != null)
                  ? Image.file(
                      note.image!,
                      width: double.infinity,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: darkColor,
                      ),
                      height: 100,
                      width: double.infinity,
                      child: const Icon(
                        Icons.note_alt_rounded,
                        size: 50,
                        color: lightColor,
                      ),
                    ),
              Text(
                note.title,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Text(
                note.content,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
