//
//  LoginProtocols.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import Foundation

/// View -> Interactor
protocol LoginInteractorProtocol: AnyObject {
    func login(request: LoginModels.Request)
}

/// Interactor -> Presenter
protocol LoginPresenterProtocol: AnyObject {
    func didFailToValidate(_ errorMessage: String)
    
    func startRequest()
    func finishRequest()
    
    func didLoginWithSuccess(response: LoginModels.Response.SuccessResponse)
    func loginDidFail(response: LoginModels.Response.ErrorResponse)
}

/// Presenter -> View
protocol LoginPresenterDelegate: AnyObject {
    func showValidationError(_ errorMessage: String)
    
    func startRequesting()
    func finishRequesting()
    
    func didLogin()
    func showLoginError(_ errorMessage: String)
}
