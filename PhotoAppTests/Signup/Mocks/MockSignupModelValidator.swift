//
//  MockSignupModelValidator.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-18.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupModelValidator: SignupFormModelValidatorProtocol {
    
    var isFirstNameValidated = false
    var isLastNameValidated = false
    var isEmailValidated = false
    var isPasswordValidated = false
    var isPasswordEqualityValidated = false
    
    func isFirstNameValid(firstName: String) -> Bool {
        isFirstNameValidated = true
        return isFirstNameValidated
    }
    
    func isLastNameValid(lastName: String) -> Bool {
        isLastNameValidated = true
        return isLastNameValidated
    }
    
    func isEmailValid(email: String) -> Bool {
        isEmailValidated = true
        return true
    }
    
    func isPasswordValide(password: String) -> Bool {
        isPasswordValidated = true
        return true
    }
    
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool {
        isPasswordEqualityValidated = true
        return true
    }
}
