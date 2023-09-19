//
//  ContentView.swift
//  Chapter4
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            // 关闭按钮
            HStack {
                Spacer()
                systemImageView
            }
            .padding(.horizontal)

            // 主要内容
            VStack(spacing: 32) {
                imageView
                textView
            }
        }
        .padding(.vertical, 32)
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }

    // 图片
    private var imageView: some View {
        Image("Healthy")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
            .cornerRadius(16)
    }

    // 文字
    private var textView: some View {
        Button(action: {
            // 点击后操作
        }) {
            Text("立即订阅")
                .font(.system(size: 17))
                .bold()
                .foregroundColor(Color.white)
                .frame(width: 120, height: 40)
                .background(Color.green)
                .cornerRadius(32)
        }
    }

    // 图标
    private var systemImageView: some View {
        Button(action: {
            // 点击后操作
        }) {
            Image(systemName: "xmark.circle.fill")
                .font(.system(size: 23))
                .foregroundColor(Color.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
