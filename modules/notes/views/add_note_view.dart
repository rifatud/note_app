import 'package:flutter/material.dart';
import 'package:note_app/modules/notes/controllers/controller.dart';

class AddNoteView extends StatelessWidget {
  AddNoteView({Key? key}) : super(key: key);
  TextEditingController notesEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Notes"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: notesEditingController,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Your Note",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  bool isSaved = await NotesController().addNote(
                      notesEditingController.text);
                  print("${isSaved}");
                  final snackBar = SnackBar(content: Text(
                      "${isSaved ? 'Note Saved' : 'Note did not save'}"),);
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Text("Add"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
