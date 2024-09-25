import 'package:flutter/cupertino.dart';

import '../Theme/theme.dart';

class ListTileIcon extends StatelessWidget {
  const ListTileIcon({super.key, required this.content});

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: darkColor,
              strokeAlign: BorderSide.strokeAlignOutside),
          borderRadius: BorderRadius.circular(5),
        ),
        child: content);
  }
}
