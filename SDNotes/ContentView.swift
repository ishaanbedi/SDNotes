
import SwiftUI
import SwiftData

@Model
class Note {
    var title: String
    var content: String

    init(title: String, content: String) {
        self.title = title
        self.content = content
    }
}

struct ContentView: View {
    @Environment(\.modelContext) private var context

    @Query(sort: \Note.title, order: .forward, animation: .spring) var notes: [Note]

    @State private var isPresentingCreateNoteSheet = false
    @State private var isEditing = false
    @State private var editedTitle = ""
    @State private var editedContent = ""

    var body: some View {
        NavigationView {
            Group {
                if notes.count == 0 {
                    Text("No notes yet!")
                } else {
                    List {
                        ForEach(notes) { note in
                            NavigationLink("\(note.title)") {
                                if isEditing {
                                    Group {
                                        Form {
                                            Section {
                                                TextField("Title", text: $editedTitle)
                                                TextEditor(text: $editedContent)
                                                    .frame(height: 250)
                                            }
                                            Section {
                                                Button {
                                                    note.title = editedTitle
                                                    note.content = editedContent
                                                    isEditing = false
                                                    editedTitle = ""
                                                    editedContent = ""
                                                } label: {
                                                    Text("Save")
                                                }
                                                Button {
                                                    isEditing = false
                                                    editedTitle = ""
                                                    editedContent = ""
                                                } label: {
                                                    Text("Cancel")
                                                        .foregroundColor(.red)
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    ScrollView {
                                        HStack {
                                            Text(note.content)
                                            Spacer()
                                        }
                                        Spacer()
                                    }
                                        .padding(.all)
                                        .toolbar {
                                        Button {
                                            isEditing = true
                                            editedTitle = note.title
                                            editedContent = note.content
                                        } label: {
                                            Image(systemName: "pencil")
                                        }
                                        Button {
                                            context.delete(note)
                                        } label: {
                                            Image(systemName: "trash")
                                        }
                                    }
                                        .navigationTitle(note.title)
                                }
                            }
                        }
                    }
                }
            }
                .navigationTitle("SDNotes")
                .toolbar {
                Button {
                    isPresentingCreateNoteSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
            .sheet(isPresented: $isPresentingCreateNoteSheet) {
            CreateNoteView()
        }
    }
}

struct CreateNoteView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.presentationMode) var presentationMode

    @State private var title: String = ""
    @State private var content: String = ""

    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        TextField("Title", text: $title)
                        TextEditor(text: $content)
                            .frame(height: 250)
                    }
                }
                    .navigationBarTitle("New Note", displayMode: .inline)
                    .navigationBarItems(
                    leading: Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    },
                    trailing: Button("Save") {
                        let newNote = Note(title: title, content: content)
                        context.insert(newNote)
                        presentationMode.wrappedValue.dismiss()
                    }
                        .disabled(title.isEmpty || content.isEmpty)
                )
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
