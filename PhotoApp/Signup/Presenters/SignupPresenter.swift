//
//  SignupPresenter.swift
//  PhotoApp
//
//  Created by Mykhailo Radzievskyi on 2023-05-18.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

class SignupPresenter: SignupPresenterProtocol {
    
    private var formModelValidator: SignupFormModelValidatorProtocol
    private var webService: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    required init(formModelValidator: SignupFormModelValidatorProtocol, webService: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webService = webService
        self.delegate = delegate
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        if !formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return
        }
        
        if !formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isEmailValid(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValide(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        
        webService.signup(withForm: requestModel) { [weak self] (responseModel, error) in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = responseModel {
                self?.delegate?.successFullSignup()
                return
            }
        }
    }
}
