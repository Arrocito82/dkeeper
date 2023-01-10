import List "mo:base/List";
import Text "mo:base/Text";
import Debug "mo:base/Debug";

actor DKeeper {

  public type Note = {
    title : Text;
    content : Text;
  };

  var notes : List.List<Note> = List.nil<Note>();

  public func createNote(titleText : Text, contentText : Text) {
    
    // create new note
    let newNote : Note = {
      title = titleText;
      content = contentText;
    };
    // Debug.print(debug_show(newNote));

    // add note to a note list
    notes:=List.push(newNote, notes);

    // Debug.print(debug_show(notes));
  };

  // query functions are much more faster because they only read data
  public query func readNotes(): async [Note]{
    return List.toArray(notes);
  };


  public func removeNote(index: Nat){
        // taking the notes from the one we want to drop till the last one
        var headNotes: List.List<Note> =  List.drop(notes, index);
        //taking the notes before the one we want to drop
        var backNotes: List.List<Note> = List.take(notes, index);
        // delete note 
        headNotes := List.drop(headNotes, 1);
        // merge head and back list together
        notes:=List.append(backNotes,headNotes);
    };
};
