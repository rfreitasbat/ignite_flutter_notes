import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  var notes = <String>["Minha primeira nota"];
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NOTES",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Center(
                child: Card(
                  child: ListTile(
                      title: Text(notes[i]),
                      onTap: () async {
                        var response = await Navigator.pushNamed(
                            context, "/create-edit-note",
                            arguments: notes[i]);
                        if (response != null) {
                          var description = response as String;
                          if (description.isEmpty) {
                            notes.removeAt(i);
                          } else {
                            notes[i] = description;
                          }
                          setState(() {});
                        }
                      }),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var description =
              await Navigator.pushNamed(context, "/create-edit-note");
          if (description != null) {
            notes.add(description as String);
            print(description);
            setState(() {});
          }
        },
      ),
    );
  }
}
