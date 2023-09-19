//
//  LoginView.swift
//  Chapter1
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
                    Spacer()
                    Image("loginImage")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Text("微信登录")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(32)
                        .padding()
                }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
