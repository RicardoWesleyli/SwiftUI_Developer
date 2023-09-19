//
//  BMIResultView.swift
//  Chapter8
//

import SwiftUI

struct BMIResultView: View {
    var height: Float
    var weight: Float
    var bmiNum: Float
    var bmiResult: String
    var bmiColor: Color
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            computeResultView
            Spacer()
            reComputeBtnView
        }
        .navigationBarHidden(true)
    }

    // 计算结果
    private var computeResultView: some View {
        VStack(spacing: 28) {
            Text("你的BMI是")
                .font(.system(size: 17))
                .foregroundColor(.gray)

            Text(String(format: "%.2f", bmiNum))
                .font(.system(size: 48))
                .bold()
                .foregroundColor(bmiColor)

            Text(bmiResult)
                .font(.system(size: 23))
                .bold()
                .foregroundColor(.white)
                .padding(.vertical, 6)
                .padding(.horizontal, 30)
                .background(bmiColor)
                .cornerRadius(32)

            HStack {
                Text(String(format: "%.1f", height) + "cm")
                Text("｜")
                Text(String(format: "%.1f", weight) + "kg")
            }
            .font(.system(size: 17))
            .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color(.systemGray6))
        .cornerRadius(16)
        .padding()
    }
    
    // 重新计算按钮
    private var reComputeBtnView: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "gobackward")
                Text("重新计算")
            }
            .font(.system(size: 17))
            .foregroundColor(.white)
            .frame(width: 200, height: 48)
            .background(Color.blue)
            .cornerRadius(8)
            .padding(.horizontal)
        }
    }
}

struct BMIResultView_Previews: PreviewProvider {
    static var previews: some View {
        BMIResultView(height: 175, weight: 70, bmiNum: 22.9, bmiResult: "正常", bmiColor: Color.green)
    }
}
