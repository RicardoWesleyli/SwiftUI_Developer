//
//  ContentView.swift
//  Chapter3
//

import SwiftUI

struct ContentView: View {
    @State var isStarted: Bool = false
    @State var isPaused: Bool = false

    var body: some View {
        VStack{
            if isPaused {
                HStack {
                    Button("停止") {
                        self.isStarted = false
                        self.isPaused = false
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .red))
                    
                    Button("继续") {
                        self.isPaused = false
                    }
                    .buttonStyle(CustomButtonStyle(backgroundColor: .green))
                }
            } else {
                Button(isStarted ? "暂停" : "开始") {
                    withAnimation {
                        if !isStarted {
                            self.isStarted = true
                        } else {
                            self.isPaused = true
                        }
                    }
                }
                .buttonStyle(CustomButtonStyle(backgroundColor: .blue))
                .transition(.asymmetric(insertion: .slide, removal: .scale))
            }
        }
//        .animation(.easeInOut(duration: 0.3), value: isPaused)
//        .animation(.spring(), value: isStarted)
    }
}

// 自定义Button按钮样式
struct CustomButtonStyle: ButtonStyle {
    var backgroundColor: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.system(size: 20))
            .foregroundColor(.white)
            .padding(.horizontal, 32)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .cornerRadius(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
