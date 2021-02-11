//
//  UsernameValidationTests.swift
//  LoginModule_Tests
//
//  Created by Bruno Maciel on 2/11/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import XCTest
@testable import LoginModule

class UsernameValidationTests: XCTestCase {
    
    let interactor = LoginInteractor()
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    // MARK: - Validation MUST FAIL
    
    func test_validateUsername_nilUsername() {
        let nilUsername: String? = nil
        
        XCTAssertThrowsError(try interactor.validateUsername(nilUsername)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.emptyUsername)
        }
    }
    
    func test_validateUsername_emptyUsername() {
        let emptyUsername: String? = ""
        
        XCTAssertThrowsError(try interactor.validateUsername(emptyUsername)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.emptyUsername)
        }
    }
    
    func test_validateUsername_onlySpacesUsername() {
        let onlySpacesUsername: String? = "    "
        
        XCTAssertThrowsError(try interactor.validateUsername(onlySpacesUsername)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.emptyUsername)
        }
    }
    
    func test_validateUsername_invalidEmail() {
        let invalidEmail: String? = "a@e@fd.fd"
        let invalidEmail2: String? = "email@email.f"
        let invalidEmail3: String? = "em ail@email.com"
        let invalidEmail4: String? = "emailemail.com"
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail2)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail3)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
        
        XCTAssertThrowsError(try interactor.validateUsername(invalidEmail4)) { error in
            XCTAssertEqual(error as! LoginInteractor.LoginError, LoginInteractor.LoginError.invalidUsername)
        }
    }
    
    
    // MARK: - Validation MUST SUCCEED
    
    func test_validateUsername_validEmail() {
        let validEmail: String? = "email@email.com"
        let validEmail2: String? = "email@email.com.br"
        let validEmail3: String? = "asd@asd.asdf"
        let validEmail4: String? = " email@email.com "
        
        XCTAssertNoThrow(try interactor.validateUsername(validEmail))
        XCTAssertNoThrow(try interactor.validateUsername(validEmail2))
        XCTAssertNoThrow(try interactor.validateUsername(validEmail3))
        XCTAssertNoThrow(try interactor.validateUsername(validEmail4))
    }

}
