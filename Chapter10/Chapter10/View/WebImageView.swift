//
//  WebImageView.swift
//  Chapter10
//

import SwiftUI

struct WebImageView: View {
    @State private var image: UIImage? = nil
//    let imageURL: String = "https://images.unsplash.com/photo-1586807480822-0e95ba6666ad?w=375"
    let imageURL: String

    var body: some View {
        VStack {
            if let image = image {
                webImageView(image: image)
            } else {
                emptyImageView
            }
        }
        .onAppear(perform: loadImage)
    }

    // 网络图片视图
    func webImageView(image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 300)
            .cornerRadius(8)
//            .padding()
    }

    // 缺省视图
    private var emptyImageView: some View {
        VStack(spacing: 20) {
            ProgressView()
            Text("加载中")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 300)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }

    // 网络请求方法
    func loadImage() {
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: URL(string: imageURL)!) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                // 获取HTTP状态码
                let statusCode = httpResponse.statusCode

                if statusCode == 200, let data = data, let fetchedImage = UIImage(data: data) {
                    // 成功获取图片数据
                    DispatchQueue.main.async {
                        self.image = fetchedImage
                    }
                } else {
                    // 处理HTTP状态码错误或数据为空
                    print("HTTP状态码错误: \(statusCode)")
                }
            } else if let error = error {
                // 处理网络请求错误
                print("错误信息: \(error.localizedDescription)")
            } else {
                // 未知错误或数据为空
                print("未知错误")
            }
        }
        task.resume()
    }
}

struct WebImageView_Previews: PreviewProvider {
    static var previews: some View {
        WebImageView(imageURL: "https://images.unsplash.com/photo-1586807480822-0e95ba6666ad?w=375")
    }
}
