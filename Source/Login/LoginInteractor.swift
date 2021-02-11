//
//  LoginInteractor.swift
//  LoginModule
//
//  Created by Bruno Maciel on 2/9/21.
//

import Foundation

class LoginInteractor {
    
    var presenter: LoginPresenterProtocol?
    var worker: LoginWorker?
    
    var userInfo: LoginResponseStruct?
    
    
    enum LoginError: Error {
        case emptyUsername, invalidUsername, emptyPassword
    }
    
    
    // MARK: - Validation Methods
    
    func validateLoginForm(form loginForm: LoginModels.Request, completion: (LoginForm) -> Void, fail: (String) -> Void) {
        do {
            let validUsername = try validateUsername(loginForm.username)
            let validPassword = try validatePassword(loginForm.password)
            
            completion(LoginForm(username: validUsername, password: validPassword))
        } catch LoginError.emptyUsername {
            fail("E-mail não informado")
        } catch LoginError.invalidUsername {
            fail("E-mail informado é inválido")
        } catch LoginError.emptyPassword {
            fail("Senha não informada")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func validateUsername(_ username: String?) throws -> String {
        guard
            let username = username?.trimmingCharacters(in: .whitespaces),
            !username.isEmpty
            else { throw LoginError.emptyUsername }
        
        if !validateEmail(username) { throw LoginError.invalidUsername }
        
        return username
    }
    
    func validatePassword(_ password: String?) throws -> String {
        guard
            let password = password,
            !password.isEmpty
            else { throw LoginError.emptyPassword }
        
        return password
    }
    
    func validateEmail(_ email: String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        
        if !emailPredicate.evaluate(with: email) { return false }
        return true
    }
    
    
    // MARK: - Login Request Methods
    
    func requestLogin(_ loginForm: LoginForm) {
        presenter?.startRequest()
        worker?.postLogin(loginForm) { response in
            self.presenter?.finishRequest()
            
            self.manageLoginResponse(response)
        } fail: { errorResponse in
            self.presenter?.finishRequest()
            
            self.manageLoginDidFailResponse(errorResponse)
        }
    }
    
    func manageLoginResponse(_ response: LoginResponseStruct) {
        userInfo = response
        
        let loginResponse = LoginModels.Response.SuccessResponse(userInfo: response)
        self.presenter?.didLoginWithSuccess(response: loginResponse)
    }
    
    func manageLoginDidFailResponse(_ response: String) {
        
        let errorResponse = LoginModels.Response.ErrorResponse(message: response)
        self.presenter?.loginDidFail(response: errorResponse)
    }
    
}


// MARK: - Access from View
extension LoginInteractor: LoginInteractorProtocol {
    func login(request: LoginModels.Request) {
        validateLoginForm(form: request) { loginForm in
            self.requestLogin(loginForm)
        } fail: { errorMessage in
            self.presenter?.didFailToValidate(errorMessage)
        }
    }
    
}
