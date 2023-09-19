//
//  ContentView.swift
//  Chapter5
//

import SwiftUI

struct ContentView: View {
    let introductionText: String = "新零售领域高级产品经理，掘金技术社区签约作者，iOS独立开发者。目前就职于广州某科技公司，负责ToB商品管理产品线。独立开发「不言笔记」、「Linkcard卡包」..."

    var body: some View {
       ScrollView {
            // 基本信息栏目
            VStack(spacing: 32) {
                // 个人头像
                Image("avatar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color(.systemGray5), lineWidth: 2)
                    )
                    .frame(width: 160)
                
                // 个人信息
                VStack(spacing: 10) {
                    Text("文如秋雨")
                        .font(.title2)
                        .bold()
                    Text("iOS开发工程师")
                        .font(.title3)
                    
                    // 工作地点
                    HStack {
                        Image(systemName: "location.circle.fill")
                            .foregroundColor(.gray)
                        Text("广州")
                            .font(.title3)
                            .foregroundColor(.gray)
                    }
                }
                
                // 个人介绍
                Text(introductionText)
                    .foregroundColor(.gray)
            }
            .padding()
            
            // 个人成就栏目
            HStack {
                VStack(spacing: 10) {
                    Text("25")
                        .font(.title2)
                        .bold()
                    Text("关注")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("1157")
                        .font(.title2)
                        .bold()
                    Text("关注者")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("1.2W")
                        .font(.title2)
                        .bold()
                    Text("掘力值")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical, 20)
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal, 20)
            .padding(.vertical,10)
            
            // 专栏列表栏目
            VStack(spacing:20){
                ForEach(Article.articles, id:\.title) { item in
                    
                    // 单个专栏项目
                    HStack(spacing: 20) {
                        // 封面
                        Image(item.image)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(4)
                        
                        // 文字信息
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.title)
                                    .font(.title2)
                                    .bold()
                                
                                Spacer()
                                
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Text("\(item.articleNum)"+"篇文章")
                                Text("\(item.subscriptionNum)"+"人订阅")
                            }
                            .foregroundColor(.gray)
                        }
                        
                        Spacer()
                    }
                    .frame(height: 80)
                    .padding(.horizontal)
                }
            }
            .padding(.vertical,20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
