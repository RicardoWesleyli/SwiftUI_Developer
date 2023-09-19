//
//  Wallpaper.swift
//  Chapter10
//

import SwiftUI

struct Wallpaper: Codable {
    let id: String
    let urls: UnsplashPhotoUrls
}

struct UnsplashPhotoUrls: Codable {
    let small: String
}
