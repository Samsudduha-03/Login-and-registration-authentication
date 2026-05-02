import 'package:id_card/auth/auth_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotesDb {
  final notesTable = Supabase.instance.client.from("notes");
  Future<void> insertNote(String content) async {
    final email = AuthServices().getCurrentEmail();
    await notesTable.insert({'content': content, 'email': email});
  }

  Future<void> updateNotes(String content, dynamic noteID) async {
    final email = AuthServices().getCurrentEmail();
    await notesTable
        .update({"content": content, "email": email}).eq("id", noteID);
  }

  Future<void> deleteNotes(dynamic noteId) async {
    await notesTable.delete().eq("id", noteId);
  }
}
