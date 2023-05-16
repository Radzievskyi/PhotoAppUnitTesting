//
//  SignupConstants.swift
//  PhotoApp
//
//  Created by Sergey Kargopolov on 2020-02-26.
//  Copyright © 2020 Sergey Kargopolov. All rights reserved.
//

import Foundation

struct SignupConstants {
    static let firstNameMinLength = 2
    static let firstNameMaxLength = 10
    static let lastNameMinLength = 2
    static let lastNameMaxLength = 15
    static let passwordMinLength = 6
    static let passwordMaxLength = 16
    static let signupURLString = "https://tlyqhtlbn8.execute-api.us-east-1.amazonaws.com/prod/signup-mock-service/users"
}
