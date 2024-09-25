import 'dart:io';

class Note {
  Note({required this.title, required this.content, required this.image});
  String title;
  String content;
  File? image;
}
