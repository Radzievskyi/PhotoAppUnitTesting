//
//  MockSignupWebService.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-20.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation
@testable import PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    var isSugnupMethodCalled: Bool = false
    var shouldReturnError = false
    
    func signup(withForm formModel: PhotoApp.SignFormRequestModel, completionHandler: @escaping (PhotoApp.SignupResponseModel?, PhotoApp.SignupError?) -> Void) {
        isSugnupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.invalidSignup)
            return
        }
        
        let responseModel = SignupResponseModel(status: "Ok")
        completionHandler(responseModel, nil)
    }
}
