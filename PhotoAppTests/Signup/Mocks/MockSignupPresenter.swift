//
//  MockSignupPresenter.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-20.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    var processUserSignupCalled = false
    
    required init(formModelValidator: PhotoApp.SignupFormModelValidatorProtocol, webService: PhotoApp.SignupWebServiceProtocol, delegate: PhotoApp.SignupViewDelegateProtocol) {
        
    }
    
    func processUserSignup(formModel: PhotoApp.SignupFormModel) {
        processUserSignupCalled = true
    }
}
