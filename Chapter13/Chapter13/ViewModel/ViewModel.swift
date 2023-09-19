//
//  ViewModel.swift
//  Chapter13
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var sentenceModel: [SentenceModel] = []

    init() {
        loadData()
    }

    // 添加笔记方法
    func addNote(sentence: String) {
        let newNote = SentenceModel(sentence: sentence, create_time: getCurrentTime())
        sentenceModel.append(newNote)
        saveData()
    }

    // 删除笔记方法
    func deleteNote(id: UUID) {
        if let index = sentenceModel.firstIndex(where: { $0.id == id }) {
            sentenceModel.remove(at: index)
            saveData()
        }
    }

    // 获得当前时间方法
    func getCurrentTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentTime = Date()
        let formattedTime = dateFormatter.string(from: currentTime)
        return formattedTime
    }

    // 保存笔记方法
    func saveData() {
        do {
            let data = try JSONEncoder().encode(sentenceModel)
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                let fileURL = documentsDirectory.appendingPathComponent("sentenceModel.json")
                try data.write(to: fileURL)
            }
        } catch {
            print("保存失败信息: \(error)")
        }
    }

    // 读取数据方法
    func loadData() {
        if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = documentsDirectory.appendingPathComponent("sentenceModel.json")
            do {
                let data = try Data(contentsOf: fileURL)
                sentenceModel = try JSONDecoder().decode([SentenceModel].self, from: data)
            } catch {
                print("读取失败信息: \(error)")
            }
        }
    }
}
