//
//  NoteView.swift
//  Chapter13
//

import SwiftUI

struct NoteView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).edgesIgnoringSafeArea(.all)
                
                if viewModel.sentenceModel.isEmpty {
                    defaultImageView
                } else {
                    noteCardList
                }
            }
            .navigationTitle("笔记")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    // 笔记列表
    private var noteCardList: some View {
        ScrollView {
            ForEach(viewModel.sentenceModel) { item in
                NoteCard(sentence: item.sentence, create_time: item.create_time)
                    .contextMenu {
                        Button("删除") {
                            viewModel.deleteNote(id: item.id)
                        }
                    }
            }
        }
        .padding(.horizontal)
    }
    
    // 缺省图
    private var defaultImageView: some View {
        Image("noNoteList")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
    }
    
}

// 笔记卡片
struct NoteCard: View {
    var sentence: String
    var create_time: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(sentence)
                    .lineLimit(2)
                Spacer()
                Text(create_time)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 60, maxHeight: 80)
        .padding()
        .background(.white)
        .cornerRadius(16)

    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
            .environmentObject(ViewModel())
    }
}
