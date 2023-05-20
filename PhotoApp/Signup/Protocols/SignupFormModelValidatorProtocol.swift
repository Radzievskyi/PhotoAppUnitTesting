//
//  SignupFormModelValidatorProtocol.swift
//  PhotoApp
//
//  Created by Mykhailo Radzievskyi on 2023-05-18.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupFormModelValidatorProtocol {
    func isFirstNameValid(firstName: String) -> Bool
    func isLastNameValid(lastName: String) -> Bool
    func isEmailValid(email: String) -> Bool
    func isPasswordValide(password: String) -> Bool
    func doPasswordMatch(password: String, repeatPassword: String) -> Bool
}
