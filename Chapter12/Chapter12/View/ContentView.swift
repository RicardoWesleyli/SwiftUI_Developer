//
//  ContentView.swift
//  Chapter12
//

import SwiftUI

struct ContentView: View {
    @StateObject var faceIDAuthManager = FaceIDAuthManager()
    @State var showingImageSourceSelection: Bool = false
    @State var showingImagePicker = false
    @State var sourceType: UIImagePickerController.SourceType = .camera
    @State var selectedImage: UIImage?
    @State var portraitImage: UIImage?
    @State var backSideImage: UIImage?

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6).edgesIgnoringSafeArea(.all)

                VStack(spacing: 20) {
                    ColumnCardView(title: "人脸识别", desc: "识别你的身份", columnImage: UIImage(named: "camera")!)
                        .onTapGesture {
                            if !faceIDAuthManager.isFaceIDAuthenticated {
                                faceIDAuthManager.authenticateWithFaceID()
                            }
                        }

                    ColumnCardView(title: "身份证正面", desc: "上传身份证人像面", columnImage: portraitImage ?? UIImage(named: "portrait")!)
                        .onTapGesture {
                            self.showingImageSourceSelection.toggle()
                        }

                    ColumnCardView(title: "身份证反面", desc: "上传身份证国徽面", columnImage: backSideImage ?? UIImage(named: "backSide")!)
                        .onTapGesture {
                            self.showingImageSourceSelection.toggle()
                        }

                    Spacer()
                }
                .padding()
            }
            .navigationTitle("身份认证")
            .navigationBarTitleDisplayMode(.inline)
        }
        .actionSheet(isPresented: $showingImageSourceSelection) {
            selectedImageSheet
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: {
            portraitImage = selectedImage
        }) {
            ImageUploadView(selectedImage: $selectedImage, sourceType: sourceType)
        }
    }

    // 选择上传方式
    private var selectedImageSheet: ActionSheet {
        ActionSheet(
            title: Text("选择上传方式"),
            buttons: [
                .default(Text("相机"), action: {
                    if UIImagePickerController.isSourceTypeAvailable(.camera) {
                        // 打开相机
                        self.sourceType = .camera
                        self.showingImagePicker.toggle()
                    } else { print("相机不可用") }
                }),
                .default(Text("相册"), action: {
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                        // 打开相册
                        self.sourceType = .photoLibrary
                        self.showingImagePicker.toggle()
                    } else { print("相册不可用") }
                }),
                .cancel(Text("取消")),
            ]
        )
    }
}

// 认证卡片
struct ColumnCardView: View {
    var title: String
    var desc: String
    var columnImage: UIImage

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .font(.title2)
                    .bold()
                Text(desc)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(uiImage: columnImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
        }
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity, maxHeight: 160)
        .background(.white)
        .cornerRadius(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
