//
//  MainTabView.swift
//  Chapter13
//

import SwiftUI

struct MainTabView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("推荐", systemImage: "square.filled.on.square")
                }

            NoteView()
                .tabItem {
                    Label("笔记", systemImage: "note.text")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ViewModel())
    }
}
