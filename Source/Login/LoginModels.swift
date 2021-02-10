//
//  LoginModels.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import Foundation

enum LoginModels {
    
    /// Object passed from View to Interactor
    struct Request {
        var username: String?
        var password: String?
    }
    
    /// Object passed from Interactor to Presenter
    enum Response {
        struct SuccessResponse {
            var userInfo: LoginResponseStruct
        }
        
        struct ErrorResponse {
            var message: String
        }
    }
    
    /// Object passed from Presenter to View
    struct ViewModel {
        var userInfo: LoginResponseStruct
    }
}


// MARK: - Entities
struct LoginForm: Encodable {
    var username: String
    var password: String
}

struct LoginResponseStruct: Decodable {
    let userId: Int?
    let name: String?
    let birthdate: String?
}
