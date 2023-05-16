//
//  SignupFormModelValidator.swift
//  PhotoAppTests
//
//  Created by Sergey Kargopolov on 2020-02-26.
//  Copyright © 2020 Sergey Kargopolov. All rights reserved.
//

import XCTest
@testable import PhotoApp

class SignupFormModelValidatorTests: XCTestCase {
    
    var sut: SignupFormModelValidator!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = SignupFormModelValidator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // MARK: - First Name

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Sergey")
        
        // Assert
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        
        // Arrange
        // Act
        let isFirstNameValid = sut.isFirstNameValid(firstName: "S")
        
        // Assert
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        
        let isFirstNameValid = sut.isFirstNameValid(firstName: "SergeySergey")
        
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: - Last Name
    
    func testSignupFormModelValidator_WhenLastNameProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Dou")

        // Assert
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignUpFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "D")

        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignUpFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isLastNameValid = sut.isLastNameValid(lastName: "Doipaipipdi paidp apoidp iapda")

        // Assert
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: - Email
    
    func testSignupFormModelValidator_WhenEmailProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "example@email.com")

        // Assert
        XCTAssertTrue(isEmailValid, "The isEmailValid() should have returned TRUE for a valid email but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenWrongFormatEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "exampleemail.com")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a wrong format email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenWrongFormatEmailProvidedV2_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "example@emai@l.com")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a wrong format email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooShortEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "e@m")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a too short email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "xae@mjaldlajdjajloiodaodoaidoijdxjakjdadjlaj.aidaidoialdajljdlkajlkjajhgjggjhgjhgjhgjggjhdsjsjddfvfgfvhfvyjtfdyrevsdhtvdfjggcom")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a too long email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenWrongCharacterBeforeAtEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "exam/ple@email.com")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a wrong character before @ at email but returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenWrongCharacterAfterAtEmailProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isEmailValid = sut.isEmailValid(email: "example@emai*l.com")

        // Assert
        XCTAssertFalse(isEmailValid, "The isEmailValid() should have returned FALSE for a wrong character after @ at email but returned TRUE")
    }
    
    // MARK: - Password
    
    func testSignupFormModelValidator_WhenPasswordProvided_ShouldReturnTrue() {
        // Arrange
        // Act
        let isPasswordValide = sut.isPasswordValide(password: "Kdnaj22%a")

        // Assert
        XCTAssertTrue(isPasswordValide, "The isPasswordValide() should have returned TRUE for a valid password but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isPasswordValide = sut.isPasswordValide(password: "K8%")

        // Assert
        XCTAssertFalse(isPasswordValide, "The isPasswordValide() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        // Arrange
        // Act
        let isPasswordValide = sut.isPasswordValide(password: "KdnKdnKn&8dajakdkadajladjdladjl")

        // Assert
        XCTAssertFalse(isPasswordValide, "The isPasswordValide() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMaxLength) characters but it has returned TRUE")
    }
}
