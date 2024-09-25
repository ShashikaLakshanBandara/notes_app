import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/model/note.dart';

import '../Theme/theme.dart';

class EditNote extends StatefulWidget {
  const EditNote({super.key, required this.index, required this.note});

  final int index;
  final Note note;

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  final _formKey = GlobalKey<FormState>();

  void _editNote() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        {
          'index': widget.index,
          'editedNote': widget.note,
        },
      );
    }
  }

  void _pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      widget.note.image = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle customTextFormStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.normal);

    var currentTitle = widget.note.title;
    var currentContent = widget.note.content;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edite Note",
        ),
        actions: [
          TextButton(
            onPressed: () {
              _editNote();
            },
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              children: [
                TextFormField(
                  style: customTextFormStyle,
                  initialValue: currentTitle,
                  decoration: InputDecoration(
                    border: customBorder,
                    errorBorder: customErrorBorder,
                    focusedBorder: customFocusBorder,
                  ),
                  validator: (title) {
                    if (title == null ||
                        title.isEmpty ||
                        title.trim().isEmpty) {
                      return "Title cannot be empty";
                    }
                    return null;
                  },
                  onSaved: (title) {
                    widget.note.title = title!;
                  },
                ),
                TextFormField(
                  style: customTextFormStyle,
                  initialValue: currentContent,
                  maxLines: null,
                  onSaved: (content) {
                    widget.note.content = content!;
                  },
                  decoration: InputDecoration(
                    border: customBorder,
                    errorBorder: customErrorBorder,
                    focusedBorder: customFocusBorder,
                  ),
                ),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: darkColor.withAlpha(100),
                        border: Border.all(
                            width: 1,
                            color: darkColor,
                            strokeAlign: BorderSide.strokeAlignOutside),
                        borderRadius: BorderRadius.circular(10)),
                    width: double.infinity,
                    height: 300,
                    child: (widget.note.image != null)
                        ? Image.file(
                            widget.note.image!,
                            fit: BoxFit.cover,
                          )
                        : Center(
                            child: ElevatedButton(
                              onPressed: _pickImage,
                              child: const Text("Add image"),
                            ),
                          ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
