//
//  NewNoteView.swift
//  Chapter7
//

import SwiftUI

struct NewNoteView: View {
    @State private var inputText: String = ""
    @Binding var showNewNoteView:Bool
    @Binding var notes:[Note]

    var body: some View {
        VStack(spacing:20){
            HStack{
                closeBtnView
                Spacer()
                submitBtnView
            }.padding(.horizontal)
            
            inputTextView
            
            Spacer()
        }.padding(.vertical)
    }

    // 关闭按钮
    private var closeBtnView: some View {
        Button(action: {
            self.showNewNoteView.toggle()
        }) {
            Image(systemName: "chevron.down.circle.fill")
                .font(.system(size: 28))
                .foregroundColor(Color(.systemGray3))
        }
    }
    
    // 完成按钮
    private var submitBtnView: some View {
        Button(action: {
            // 新增数据
            self.notes.append(Note(noteContent: inputText))
            
            // 关闭弹窗
            self.showNewNoteView.toggle()
        }) {
            Text("完成")
                .font(.system(size: 17))
                .foregroundColor(.white)
                .padding(.all,8)
                .background(.green)
                .cornerRadius(8)
        }
    }

    // 文本框
    private var inputTextView: some View {
        TextField("请输入", text: $inputText, axis: .vertical)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(.horizontal)
    }
}

struct NewNoteView_Previews: PreviewProvider {
    static var previews: some View {
        NewNoteView(showNewNoteView: .constant(false), notes: .constant([]))
    }
}
