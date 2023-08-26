import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rememorise/models/memory.dart';
import 'package:rememorise/widgets/progress.dart';

import '../blocs/memories_bloc.dart';
import '../utils/consts.dart';
import '../widgets/inputfeild.dart';

class NoteDetailScreen extends StatefulWidget {
  const NoteDetailScreen({super.key, this.memory});
  final Memory? memory;

  @override
  State<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends State<NoteDetailScreen> {
  TextEditingController? _emailController;
  TextEditingController? _tagController;
  TextEditingController? _titleController;
  TextEditingController? _descController;
  bool notifications = false;
  bool readOnly = true;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _emailController = TextEditingController();
    _tagController = TextEditingController();
    if (widget.memory == null) {
      readOnly = false;
    } else {
      _titleController?.text = widget.memory?.subject ?? '';
      _descController?.text = widget.memory?.description ?? '';
      _emailController?.text = widget.memory?.email ?? '';
      _tagController?.text = widget.memory?.tags?.join(",") ?? '';
      notifications = widget.memory?.notify ?? false;
    }
    super.initState();
  }

  onSubmit() async {
    if (_formKey.currentState!.validate()) {
      final tags = (_tagController?.text ?? '').split(",");
      final body = {
        "email": _emailController!.text,
        "subject": _titleController!.text,
        "description": _descController!.text,
        "tags": tags,
        "notify": notifications
      };

      showProgressDialog(context);
      String res = "";
      if (widget.memory == null) {
        res = await Provider.of<MemoriesBloc>(context, listen: false)
            .addNewMemory(body);
      } else {
        body['_id'] = widget.memory!.id!;
        res = await Provider.of<MemoriesBloc>(context, listen: false)
            .updateMemory(body);
      }

      Navigator.pop(context);
      SnackBar snackBar;
      if (res.isNotEmpty) {
        snackBar = SnackBar(backgroundColor: Palates.red, content: Text(res));
      } else {
        snackBar = SnackBar(
            backgroundColor: Palates.green,
            content: Text(
                "Successfully ${widget.memory == null ? 'new added' : 'updated'} "));
        Navigator.pop(context);
        Provider.of<MemoriesBloc>(context, listen: false).fetchMemory();
      }
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  onDelete() async {
    showProgressDialog(context);
    String res = await Provider.of<MemoriesBloc>(context, listen: false)
        .deleteMemory(widget.memory?.id);
    Navigator.pop(context);
    SnackBar snackBar;
    if (res.isNotEmpty) {
      snackBar = SnackBar(backgroundColor: Palates.red, content: Text(res));
    } else {
      snackBar = SnackBar(
          backgroundColor: Palates.green,
          content: const Text("Successfully deleted"));
      Navigator.pop(context);
      Provider.of<MemoriesBloc>(context, listen: false).fetchMemory();
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        title: Text(widget.memory == null ? "New memory" : "Memory"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              InputField(
                readOnly: readOnly,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                controller: _emailController,
                hintText: "Enter email",
                label: "Email",
                maxlength: null,
                keyboardType: TextInputType.emailAddress,
                validator: (s) =>
                    s == null || s.isEmpty ? "Invalid email" : null,
              ),
              const SizedBox(height: 16),
              InputField(
                readOnly: readOnly,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                controller: _titleController,
                hintText: "Subject",
                label: "Subject",
                maxlength: 40,
                keyboardType: TextInputType.name,
                validator: (s) =>
                    s == null || s.isEmpty ? "Invalid Subject" : null,
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 2,
                child: InputField(
                  readOnly: readOnly,
                  maxlength: null,
                  maxLines: null,
                  minLines: null,
                  expands: true,
                  validator: (s) =>
                      s == null || s.isEmpty ? "Invalid Description" : null,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  controller: _descController,
                  hintText: "Type here...",
                  label: "Description",
                  keyboardType: TextInputType.multiline,
                ),
              ),
              const SizedBox(height: 16),
              InputField(
                readOnly: readOnly,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                controller: _tagController,
                hintText: "Enter tags",
                label: "Tags",
                maxlength: null,
                keyboardType: TextInputType.text,
                validator: (s) =>
                    s == null || s.isEmpty ? "Invalid tags" : null,
              ),
              Text(
                " Comma (,) separated tags ex- memory, lifestyle",
                style: TextStyle(fontSize: 12, color: Palates.textColor2),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text("Get email notifications"),
                  const SizedBox(width: 10),
                  CupertinoSwitch(
                    activeColor: Colors.deepPurpleAccent,
                    value: notifications,
                    onChanged: readOnly
                        ? null
                        : (bool value) {
                            setState(() {
                              notifications = value;
                            });
                          },
                  )
                ],
              ),
              const SizedBox(height: 16),
              if (readOnly)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Palates.red,
                        child: Text(
                          "Delete",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        onPressed: onDelete),
                    const SizedBox(width: 10),
                    CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Palates.primary,
                        child: const Text(
                          "Edit",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {
                          setState(() {
                            readOnly = !readOnly;
                          });
                        }),
                  ],
                )
              else
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Palates.textLight,
                        child: const Text(
                          "Cancel",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        onPressed: () => GoRouter.of(context).pop()),
                    const SizedBox(width: 10),
                    CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        color: Palates.primary,
                        onPressed: onSubmit,
                        child: const Text(
                          "Save",
                          style: TextStyle(fontWeight: FontWeight.normal),
                        )),
                  ],
                ),
              const Spacer(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
