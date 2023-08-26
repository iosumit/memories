import 'package:flutter/material.dart';
import 'package:rememorise/models/memory.dart';
import 'package:rememorise/utils/extensions.dart';

import '../utils/consts.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, this.onTap, required this.memory});
  final Function()? onTap;
  final Memory memory;

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
              memory.subject!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Palates.black,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                memory.description!,
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
                memory.updatedAt!.toDate,
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
