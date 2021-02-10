//
//  LoginWorker.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import Foundation

class LoginWorker {
    
    func postLogin(_ loginForm: LoginForm, completion: @escaping (LoginResponseStruct) -> Void, fail: @escaping (String) -> Void) {
        
        RequestDelaySimulator.simulate(delay: 1.0) {
            completion(LoginResponseStruct(userId: 1, name: "John Doe", birthdate: "2000-10-08"))
        }
    }
    
}


class RequestDelaySimulator {
    private init() {}
    
    static func simulate(delay: Double, action: @escaping () -> Void) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                action()
            }
        }
    }
}
