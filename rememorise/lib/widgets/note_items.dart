import 'package:flutter/material.dart';

import '../utils/consts.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: Palates.border, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Title",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Palates.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                "Description " * 10,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Palates.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "23 Aug, 23",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Palates.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
