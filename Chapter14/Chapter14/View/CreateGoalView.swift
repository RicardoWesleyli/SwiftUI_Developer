//
//  CreateGoalView.swift
//  Chapter14
//

import SwiftUI

struct CreateGoalView: View {
    @ObservedObject var goalViewModel: GoalViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var goalText: String = ""
    @State var targetDate: Date = Date()

    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                goalTextView
                targetDatePickerView
                Spacer()
            }
            .padding(.vertical,32)
            .navigationBarItems(leading: closeBtnView,trailing: commitBtnView)
        }
    }

    // 关闭按钮
    private var closeBtnView: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "x.circle.fill")
                .font(.title)
                .foregroundColor(Color(.systemGray3))
        })
    }
    
    // 确定按钮
    private var commitBtnView: some View {
        Button(action: {
            // 新增目标
            goalViewModel.addGoal(goalText: goalText, targetDate: targetDate)
            // 关闭弹窗
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("确定")
                .bold()
                .foregroundColor(.white)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .background(.green)
                .clipShape(Capsule())
        })
    }

    // 目标名称
    private var goalTextView: some View {
        TextField("写下你的目标", text: $goalText)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(16)
            .padding(.horizontal)
    }

    // 达成日期
    private var targetDatePickerView: some View {
        VStack {
            HStack {
                Text("达成日期")
                Spacer()
                Text(targetDate.toString())
            }
            DatePicker("", selection: $targetDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(.wheel)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding(.horizontal)
    }
}

struct CreateGoalView_Previews: PreviewProvider {
    static var previews: some View {
        CreateGoalView(goalViewModel: GoalViewModel())
    }
}
