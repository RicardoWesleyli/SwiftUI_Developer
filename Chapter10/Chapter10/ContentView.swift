//
//  ContentView.swift
//  Chapter10
//

import SwiftUI

struct ContentView: View {
    let imageURL: String = "https://images.unsplash.com/photo-1586807480822-0e95ba6666ad?w=375"
    @State private var imageID:UUID = UUID()

    var body: some View {
        VStack(spacing: 20) {
            webImageView
                .id(imageID)
            refreshBtnView
        }
    }
    
    // 网络图片视图
    private var webImageView: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .success(image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                    .padding()
            case .failure:
                Text("加载失败了")
            @unknown default:
                EmptyView()
            }
        }
    }
    
    // 刷新按钮视图
    private var refreshBtnView: some View {
        Button(action: {
            self.imageID = UUID()
        }, label: {
            HStack {
                Image(systemName: "gobackward")
                Text("重新加载")
            }
            .foregroundColor(.white)
            .padding()
            .background(.green)
            .cornerRadius(8)
            .padding()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
