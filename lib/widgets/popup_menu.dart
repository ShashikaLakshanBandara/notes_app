import 'package:flutter/material.dart';
import 'package:notes_app/Theme/theme.dart';
import 'package:notes_app/model/note.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.onClickDelete,
    required this.onClickEdit,
    required this.note,
    required this.index,
  });

  final int index;
  final Note note;
  final void Function(Note note) onClickDelete;
  final void Function(Note note, int index) onClickEdit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<String>(
          value: 'Edit',
          child: Row(
            children: [
              Icon(Icons.edit, color: darkColor),
              SizedBox(width: 8),
              Text('Edit', style: TextStyle(color: darkColor)),
            ],
          ),
        ),
        const PopupMenuItem<String>(
          value: 'Delete',
          child: Row(
            children: [
              Icon(Icons.delete, color: darkColor),
              SizedBox(width: 8),
              Text(
                style: TextStyle(color: darkColor),
                'Delete',
              ),
            ],
          ),
        ),
      ],
      onSelected: (String choice) {
        if (choice == 'Edit') {
          onClickEdit(note, index);
        } else if (choice == 'Delete') {
          onClickDelete(note);
        }
      },
    );
  }
}
