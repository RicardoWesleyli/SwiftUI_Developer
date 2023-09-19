//
//  ContentView.swift
//  Chapter7
//

import SwiftUI

struct ContentView: View {
    @State private var notes = Note.notes
    @State private var showNewNoteView: Bool = false

    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack {
                noteTitleView
                noteListView
            }
            addBtnView
        }
        .sheet(isPresented:$showNewNoteView) {
            NewNoteView(showNewNoteView: $showNewNoteView, notes: $notes)
                .presentationDetents([.medium])
        }
    }
    
    // 页面标题
    private var noteTitleView: some View {
        Text("Note笔记")
            .font(.title)
            .bold()
    }

    // 笔记列表
    private var noteListView: some View {
        List($notes,editActions: .all) { $note in
            Text(note.noteContent)
        }
        .listStyle(.plain)
    }
    
    // 新增按钮
    private var addBtnView: some View {
        Button(action: {
            self.showNewNoteView.toggle()
        }) {
            Image(systemName: "plus.circle.fill")
                .font(.system(size: 48))
                .padding(.horizontal)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
