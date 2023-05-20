//
//  SignupWebServiceProtocol.swift
//  PhotoApp
//
//  Created by Mykhailo Radzievskyi on 2023-05-20.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
