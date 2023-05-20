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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSignupViewController_WhenCreated_HasRequiredTextFieldEmpty() {
        // Assign
        let storyboar = UIStoryboard(name: "Main", bundle: nil)
        let sut = storyboar.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController
        
        // Act
        // Assert
    }

}
