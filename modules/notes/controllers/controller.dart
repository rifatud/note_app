import 'package:note_app/core/config.dart';
import 'package:note_app/interfaces/notes.dart';
import 'package:shared_preferences/shared_preferences.dart';



class NotesController implements AbsNotesController {
  @override
  Future<bool> addNote(String note) async{
    // TODO: implement addNote
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? currentNotes = handle.getStringList(Config.notes_key);
    if (currentNotes != null) {
      currentNotes.add(note);
      return await handle.setStringList(Config.notes_key, currentNotes);
    }else{
      return await handle.setStringList(Config.notes_key, [note]);
    }



    throw UnimplementedError();

  }

  @override
  Future<bool> deleteNote(int index) async{
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? notes = handle.getStringList(Config.notes_key);
    if(notes != null){
      notes.removeAt(index);
    }
    return await handle.setStringList(Config.notes_key, notes!);
    throw UnimplementedError();
  }

  @override
  Future<List<String>?> getNotes() async{
    SharedPreferences handle = await SharedPreferences.getInstance();
    return handle.getStringList(Config.notes_key);
    throw UnimplementedError();
  }

  @override
  Future<bool> updateNote(String note, int index) async{
    SharedPreferences handle = await SharedPreferences.getInstance();
    List<String>? notes = handle.getStringList(Config.notes_key);
    if (notes!= null) {
      notes[index] = note;
    }
    return await handle.setStringList(Config.notes_key, notes!);
  }

}