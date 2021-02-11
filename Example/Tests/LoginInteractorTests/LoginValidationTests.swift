//
//  LoginValidationTests.swift
//  LoginModule_Tests
//
//  Created by Bruno Maciel on 2/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import LoginModule

class LoginValidationTests: XCTestCase {
    
    let interactor = LoginInteractor()
    let blankUsername: String? = ""
    let blankPassword: String? = ""
    let invalidUsername: String? = "qwert"
    let validUsername: String? = " email@email.com"
    let validPassword: String? = "1234"
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // MARK: - Validation MUST FAIL
    
    func test_validateUsername_blankUsername() {
        let blankUsernameForm = LoginModels.Request(username: blankUsername, password: validPassword)
        
        interactor.validateLoginForm(form: blankUsernameForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, "E-mail não informado")
        }
    }
    
    func test_validateUsername_invalidUsername() {
        let invalidUsernameForm = LoginModels.Request(username: invalidUsername, password: validPassword)
        
        interactor.validateLoginForm(form: invalidUsernameForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, "E-mail informado é inválido")
        }
    }
    
    func test_validateUsername_blankPasssword() {
        let blankPasswordForm = LoginModels.Request(username: validUsername, password: blankPassword)
        
        interactor.validateLoginForm(form: blankPasswordForm) { _ in
            XCTAssertFalse(true)
        } fail: { errorMessage in
            XCTAssertTrue(true)
            XCTAssertEqual(errorMessage, "Senha não informada")
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validateUsername_validLogin() {
        let validLoginForm = LoginModels.Request(username: validUsername, password: validPassword)
        
        interactor.validateLoginForm(form: validLoginForm) { loginForm in
            XCTAssertTrue(true)
            XCTAssert(loginForm.username == validLoginForm.username!.trimmingCharacters(in: .whitespaces))
            XCTAssert(loginForm.password == validLoginForm.password!)
        } fail: { _ in
            XCTAssertFalse(true)
        }
    }

}
