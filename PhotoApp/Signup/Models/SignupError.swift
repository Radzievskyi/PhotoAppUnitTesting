//
//  SignupError.swift
//  PhotoApp
//
//  Created by Mykhailo Radzievskyi on 2023-05-16.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

enum SignupError: LocalizedError, Equatable {
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description: String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel, .invalidRequestURLString:
            return ""
        }
    }
}
