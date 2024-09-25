import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notes_app/model/note.dart';

import '../Theme/theme.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  File? _selectedImage;
  final _formKey = GlobalKey<FormState>();

  void _pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage == null) {
      return;
    }
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
  }

  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop(
        Note(
            image: _selectedImage,
            title: _enteredTitle,
            content: _enteredContent),
      );
    }
  }

  var _enteredTitle = "";
  var _enteredContent = "";

  @override
  Widget build(BuildContext context) {
    final TextStyle customTextFormStyle = Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.normal);

    Widget imageContainerContent = Center(
      child: ElevatedButton(
        onPressed: _pickImage,
        child: const Text("Add image"),
      ),
    );

    if (_selectedImage != null) {
      imageContainerContent = Image.file(
        _selectedImage!,
        fit: BoxFit.cover,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Note"),
        actions: [
          TextButton(
            onPressed: _saveNote,
            child: Text(
              "Save",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: lightColor),
            ),
          ),
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
                  decoration: InputDecoration(
                    label: Text(
                      "Title",
                      style: customTextFormStyle,
                    ),
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
                    _enteredTitle = title!;
                  },
                ),
                TextFormField(
                  style: customTextFormStyle,
                  decoration: InputDecoration(
                      label: Text(
                        "Content",
                        style: customTextFormStyle,
                      ),
                      border: customBorder,
                      errorBorder: customErrorBorder,
                      focusedBorder: customFocusBorder),
                  maxLines: null,
                  onSaved: (content) {
                    _enteredContent = content!;
                  },
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
                    child: imageContainerContent,
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
