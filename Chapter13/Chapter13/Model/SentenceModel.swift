//
//  SentenceModel.swift
//  Chapter13
//

import SwiftUI

struct SentenceModel: Identifiable, Codable {
    var id: UUID = UUID()
    var sentence: String
    var create_time: String
}
