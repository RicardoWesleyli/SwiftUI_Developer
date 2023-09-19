//
//  Article.swift
//  Chapter5
//

import SwiftUI

struct Article {
    var image: String
    var title: String
    var articleNum: Int
    var subscriptionNum: Int
    
    static let articles = [
        Article(image: "001", title: "SwiftUI项目实战", articleNum: 22, subscriptionNum: 245),
        Article(image: "001", title: "SwiftUI 100days", articleNum: 37, subscriptionNum: 309),
        Article(image: "001", title: "SwiftUI极简教程", articleNum: 42, subscriptionNum: 425)
    ]
}
