//
//  MockSignupViewDelegate.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-20.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation
import XCTest
@testable import PhotoApp

class MockSignupViewDelegate: SignupViewDelegateProtocol {
    var expectation: XCTestExpectation?
    var successfulSignupCounter = 0
    var errorSignupCounter = 0
    var handlerError: PhotoApp.SignupError?
    
    func successFullSignup() {
        successfulSignupCounter += 1
        expectation?.fulfill()
    }
    
    func errorHandler(error: PhotoApp.SignupError) {
        handlerError = error
        errorSignupCounter += 1
        expectation?.fulfill()
    }
}
