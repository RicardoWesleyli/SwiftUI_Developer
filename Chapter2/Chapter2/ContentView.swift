//
//  ContentView.swift
//  Chapter2
//

import SwiftUI

struct ContentView: View {
    let sentences = [
        "新鲜感总会过去，但责任和教养不会。",
        "不管我本人多么平庸，我总觉得对你的爱很美",
        "静下来想你，觉得一切美好得不可思议。",
        "我如果明天收不到你的信，我就摔茶杯。",
        "吾自遇见汝以来，常愿天下有情人都成眷属。",
    ]
    
    @State var sentence: String = ""

    var body: some View {
        ZStack {
            Image("cloud")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(8.0)
            Text(sentence)
        }
        .padding(.horizontal)
        
        // 视图显示时
        .onAppear(perform:{
            self.sentence = sentences.randomElement() ?? ""
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
