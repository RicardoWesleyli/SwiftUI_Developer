//
//  WallpaperGridView.swift
//  Chapter10
//

import SwiftUI

struct WallpaperGridView: View {
    @State private var wallpapers: [Wallpaper] = []

    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    let unsplashURL: String = "https://api.unsplash.com/photos/random/?count=30&client_id=XXXXXX"

    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
                    ForEach(wallpapers, id: \.id) { wallpaper in
                        WebImageView(imageURL: wallpaper.urls.small)
                    }
                }
            }
            .padding(.horizontal)
            .navigationTitle("壁纸推荐")
        }
        .onAppear {
            fetchPhotos()
        }
    }

    // 网络请求
    func fetchPhotos() {
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: URL(string: unsplashURL)!) { data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                // 获取HTTP状态码
                let statusCode = httpResponse.statusCode

                if statusCode == 200, let data = data {
                    // 成功获取图片数据
                    do {
                        let decoder = JSONDecoder()
                        let decodedPhotos = try decoder.decode([Wallpaper].self, from: data)
                        DispatchQueue.main.async {
                            self.wallpapers = decodedPhotos
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
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

struct WallpaperGridView_Previews: PreviewProvider {
    static var previews: some View {
        WallpaperGridView()
    }
}
