import 'package:flutter/material.dart';

class CreateEditNotePage extends StatefulWidget {
  @override
  _CreateEditNotePageState createState() => _CreateEditNotePageState();
}

class _CreateEditNotePageState extends State<CreateEditNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEdit = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        isEdit = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? "Edit Note" : "Create Note"),
        centerTitle: true,
        actions: [
          if (isEdit)
            IconButton(
              onPressed: () {
                Navigator.pop(context, "");
              },
              icon: Icon(Icons.delete),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              maxLines: 10,
              onChanged: (value) {
                description = value;
                setState(() {});
              },
              decoration: InputDecoration(labelText: "Descrição"),
            ),
            SizedBox(
              height: 10,
            ),
            if (description.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, description);
                      },
                      child: Text("Salvar"),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
