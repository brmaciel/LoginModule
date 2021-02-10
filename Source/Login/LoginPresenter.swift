//
//  LoginPresenter.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import UIKit

class LoginPresenter {
    
    weak var view: LoginPresenterDelegate?
    var router: LoginRouter?
    
    
    // MARK: - Methods
    
    
    
}


// MARK: - Access from Interactor
extension LoginPresenter: LoginPresenterProtocol {
    func didFailToValidate(_ errorMessage: String) {
        view?.showValidationError(errorMessage)
    }
    
    func startRequest() {
        view?.startRequesting()
    }
    
    func finishRequest() {
        view?.finishRequesting()
    }
    
    func didLoginWithSuccess(response: LoginModels.Response.SuccessResponse) {
        let viewModel = LoginModels.ViewModel(userInfo: response.userInfo)
                
        view?.didLogin()
        router?.didLogin(data: viewModel)
    }
    
    func loginDidFail(response: LoginModels.Response.ErrorResponse) {
        view?.showLoginError(response.message)
    }
    
}
