//
//  PasswordValidationTests.swift
//  LoginModule_Tests
//
//  Created by Bruno Maciel on 2/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import LoginModule

class PasswordValidationTests: XCTestCase {
    
    let interactor = LoginInteractor()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // MARK: - Validation MUST FAIL
    
    func test_validatePassword_nilPassword() {
        let nilPassword: String? = nil
        
        XCTAssertThrowsError(try interactor.validatePassword(nilPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.emptyPassword)
        }
    }
    
    func test_validatePassword_emptyPassword() {
        let emptyPassword: String? = ""
        
        XCTAssertThrowsError(try interactor.validatePassword(emptyPassword)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.emptyPassword)
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validatePassword_notEmptyPassword() {
        let notEmptyPassword = "1234"
        
        XCTAssertNoThrow(try interactor.validatePassword(notEmptyPassword))
    }

}
