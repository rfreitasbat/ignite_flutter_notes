import 'package:flutter/material.dart';
import 'package:notes/modules/login/model/user_model.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    var notes = <String>["Minha primeira nota"];
    return Scaffold(
      appBar: AppBar(
        leading: ClipRRect(
          child: Image.network(user.photoUrl!),
        ),
        title: Text(
          "NOTES",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
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
        ],
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
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
