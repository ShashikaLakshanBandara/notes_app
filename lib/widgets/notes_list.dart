import 'package:flutter/material.dart';
import 'package:notes_app/model/note.dart';
import 'package:notes_app/widgets/list_tile_Icon.dart';
import 'package:notes_app/widgets/popup_menu.dart';

class NotesList extends StatelessWidget {
  const NotesList({
    super.key,
    required this.notes,
    required this.onClickNote,
    required this.onClickDelete,
    required this.onClickEdit,
  });

  final List<Note> notes;
  final void Function(BuildContext context, Note note) onClickNote;
  final void Function(Note note) onClickDelete;
  final void Function(Note note, int index) onClickEdit;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notes.length,
      itemBuilder: (ctx, index) => ListTile(
        onTap: () {
          onClickNote(context, notes[index]);
        },
        title: Text(notes[index].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(
          notes[index].content,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        leading: (notes[index].image == null)
            ? const ListTileIcon(content: Icon(Icons.note_alt))
            : ListTileIcon(
                content: Image.file(
                  notes[index].image!,
                  fit: BoxFit.cover,
                ),
              ),
        trailing: PopupMenu(
          note: notes[index],
          onClickDelete: onClickDelete,
          onClickEdit: onClickEdit,
          index: index,
        ),
      ),
    );
  }
}
