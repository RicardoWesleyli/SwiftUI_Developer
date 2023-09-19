//
//  FaceIDAuthManager.swift
//  Chapter12
//

import LocalAuthentication
import SwiftUI

class FaceIDAuthManager: ObservableObject {
    @Published var isFaceIDAuthenticated = false

    func authenticateWithFaceID() {
        let context = LAContext()
        var error: NSError?

        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "使用FaceID进行认证。"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, _ in
                DispatchQueue.main.async {
                    if success {
                        self.isFaceIDAuthenticated = true
                        print("成功认证")
                    } else {
                        self.isFaceIDAuthenticated = false
                        print("认证失败")
                    }
                }
            }
        } else {
            print("没有生物识别")
        }
    }
}
