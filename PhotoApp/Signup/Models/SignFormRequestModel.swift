//
//  SignFormRequestModel.swift
//  PhotoApp
//
//  Created by Mykhailo Radzievskyi on 2023-05-16.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

struct SignFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
