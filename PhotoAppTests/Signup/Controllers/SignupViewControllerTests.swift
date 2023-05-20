//
//  SignupViewControllerTests.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-20.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

final class SignupViewControllerTests: XCTestCase {
    var storyboar: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        storyboar = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboar.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        storyboar = nil
        sut = nil
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldEmpty() throws {
        let firstNameTestField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        XCTAssertEqual(firstNameTestField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "Repeat Password text field was not empty when the view controller initially loaded")
    }

    func testSignupViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Arrange
        let signupButton = try XCTUnwrap(sut.signupButton, "Signup button is not have a referencing outlet")
        
        // Act
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        
        // Assert
        XCTAssertEqual(signupButtonActions.count, 1, "Sognup Button does not have any actions assigned to it")
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonType assigned to signup button")
    }
    
    func testSignupViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Arrange
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webService: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        // Act
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Assert
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
}
