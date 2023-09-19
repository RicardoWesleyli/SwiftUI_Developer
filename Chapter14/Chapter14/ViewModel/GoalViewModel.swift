//
//  GoalViewModel.swift
//  Chapter14
//

import CoreData
import SwiftUI

class GoalViewModel: ObservableObject {
    @Published var goals: [Goal] = []

    // 加载数据
    func fetchGoals() {
        let context = Persistence.shared.container.viewContext
        let fetchRequest: NSFetchRequest<Goal> = Goal.fetchRequest()
        do {
            goals = try context.fetch(fetchRequest)
        } catch {
            print("Failed to fetch goals: \(error.localizedDescription)")
        }
    }

    // 新增目标
    func addGoal(goalText: String, targetDate: Date) {
        let context = Persistence.shared.container.viewContext
        let newGoal = Goal(context: context)
        newGoal.id = UUID()
        newGoal.goalText = goalText
        newGoal.targetDate = targetDate
        newGoal.currentProgress = 0
        do {
            try context.save()
            fetchGoals()
        } catch {
            print("Failed to save goal: \(error.localizedDescription)")
        }
    }

    // 编辑目标
    func editGoal(goal: Goal, updatedText: String, updatedTargetDate: Date, updatedProgress: Int) {
        let context = Persistence.shared.container.viewContext
        goal.goalText = updatedText
        goal.targetDate = updatedTargetDate
        goal.currentProgress = updatedProgress
        do {
            try context.save()
        } catch {
            print("Failed to edit goal: \(error.localizedDescription)")
        }
    }
    
    
    // 删除目标
    func deleteGoal(goal: Goal) {
        let context = Persistence.shared.container.viewContext
        context.delete(goal)
        do {
            try context.save()
            if let index = goals.firstIndex(of: goal) {
                goals.remove(at: index)
            }
        } catch {
            print("Failed to delete goal: \(error.localizedDescription)")
        }
    }

    // 更新进度
    func updatedGoalProgress(goal: Goal, updatedProgress: Int) {
        let context = Persistence.shared.container.viewContext
        goal.currentProgress = updatedProgress
        do {
            try context.save()
        } catch {
            print("Failed to edit goal: \(error.localizedDescription)")
        }
    }
}
