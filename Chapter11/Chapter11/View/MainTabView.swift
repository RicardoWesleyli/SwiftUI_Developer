//
//  MainTabView.swift
//  Chapter11
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("首页")
                }
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("日历")
                }

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("我的")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
