import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../utils/consts.dart';
import '../widgets/inputfeild.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key});

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  TextEditingController? _titleController;
  TextEditingController? _descController;
  bool notifications = false;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: const Text("Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            InputField(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              controller: _titleController,
              hintText: "Title",
              label: "Title",
              maxlength: 40,
              keyboardType: TextInputType.multiline,
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: InputField(
                maxlength: null,
                maxLines: null,
                minLines: null,
                expands: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                controller: _descController,
                hintText: "Type here...",
                label: "Contents",
                keyboardType: TextInputType.multiline,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text("Get email notifications"),
                const SizedBox(width: 10),
                CupertinoSwitch(
                  activeColor: Colors.deepPurpleAccent,
                  value: notifications,
                  onChanged: (bool value) {
                    setState(() {
                      notifications = value;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CupertinoButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Palates.textLight,
                    child: const Text(
                      "CANCEL",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    onPressed: () => GoRouter.of(context).pop()),
                const SizedBox(width: 10),
                CupertinoButton(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Palates.primary,
                    child: const Text(
                      "SAVE",
                      style: TextStyle(fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {}),
              ],
            ),
            const Spacer(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
