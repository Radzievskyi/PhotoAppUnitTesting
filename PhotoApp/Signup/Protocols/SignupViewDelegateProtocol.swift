//
//  SignupViewDelegateProtocol.swift
//  PhotoApp
//
//  Created by Mykhailo Radzievskyi on 2023-05-20.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successFullSignup()
    func errorHandler(error: SignupError)
}
