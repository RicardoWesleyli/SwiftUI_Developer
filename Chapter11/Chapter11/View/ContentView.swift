//
//  ContentView.swift
//  Chapter11
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.historyDaily,id: \.id) { item in
                    TextItem(id: item.id, year: item.year, text: item.body)
                }
            }
            .navigationTitle("历史上的今天")
        }
        .onAppear(perform: {
            viewModel.fetchTodayInHistory()
        })
    }
}

// 文字Item视图
struct TextItem: View {
    var id: Int
    var year: Int
    var text: String
    var body: some View {
        HStack(spacing: 10) {
            Text("\(year)")
                .frame(maxWidth: 80,maxHeight: 120)
                .background(Color(.systemGray6))
                .cornerRadius(8)
            Text(text)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, minHeight: 80)
                .padding(.horizontal)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .lineLimit(2)
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
