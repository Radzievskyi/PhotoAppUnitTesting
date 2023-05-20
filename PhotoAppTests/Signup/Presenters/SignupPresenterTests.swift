//
//  SignupPresenterTests.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-18.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

final class SignupPresenterTests: XCTestCase {
    var signupFormModel: SignupFormModel!
    var mockSignupModelValidator: MockSignupModelValidator!
    var mockSignupWebService: MockSignupWebService!
    var sut: SignupPresenter!
    var mockSignupViewDelegate: MockSignupViewDelegate!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        signupFormModel = SignupFormModel(firstName: "John",
                                            lastName: "Dou",
                                            email: "john@dou.com",
                                            password: "123456",
                                            repeatPassword: "123456")
        
        mockSignupModelValidator = MockSignupModelValidator()
        
        mockSignupWebService = MockSignupWebService()
        mockSignupViewDelegate = MockSignupViewDelegate()
        
        sut = SignupPresenter(formModelValidator: mockSignupModelValidator,
                              webService: mockSignupWebService,
                              delegate: mockSignupViewDelegate)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        signupFormModel = nil
        mockSignupModelValidator = nil
        mockSignupWebService = nil
        mockSignupViewDelegate = nil
        sut = nil
    }

    func testSignupPresenter_WhenInformationProvided_WillValidateEachProperty() {
        // Arrange
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupModelValidator.isFirstNameValidated, "First Name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isLastNameValidated, "Last Name was not validated")
        XCTAssertTrue(mockSignupModelValidator.isEmailValidated, "Email was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordValidated, "Password was not validated")
        XCTAssertTrue(mockSignupModelValidator.isPasswordEqualityValidated, "Did not valid if password match")
    }

    func testSignupPresenter_WhenGivenValidFormModel_ShouldCallSignupMethod() {
        // Arrange
       
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        
        // Assert
        XCTAssertTrue(mockSignupWebService.isSugnupMethodCalled, "The signup() method was not called in the SignupWebService class")
    }
    
    func testSignupPresenter_WhenSignupOperationSuccessful_CallsSuccessOnViewDelegate() {
        // Arrange
       let myExpectation = expectation(description: "Expectet the successfulSignup() method to be called")
        
        mockSignupViewDelegate.expectation = myExpectation
        
        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 1, "The successFullSignup() method was called not 1 time")
    }
    
    func testSignupPresenter_WhenSignupOperationFailed_ShouldCallErrorOnViewDelegate() {
        // Arrange
       let myExpectation = expectation(description: "Expectet the errorHandler() method to be called")

        mockSignupWebService.shouldReturnError = true
        mockSignupViewDelegate.expectation = myExpectation

        // Act
        sut.processUserSignup(formModel: signupFormModel)
        self.wait(for: [myExpectation], timeout: 5)
        
        //Assert
        XCTAssertEqual(mockSignupViewDelegate.successfulSignupCounter, 0, "The successFullSignup() method was called")
        XCTAssertEqual(mockSignupViewDelegate.errorSignupCounter, 1, "The errorHandler() method was called not 1 time")
        XCTAssertEqual(mockSignupViewDelegate.handlerError, PhotoApp.SignupError.invalidSignup, "The errorHandler() expected to be invalidSignup but instead is \(mockSignupViewDelegate.handlerError)")
    }
}
