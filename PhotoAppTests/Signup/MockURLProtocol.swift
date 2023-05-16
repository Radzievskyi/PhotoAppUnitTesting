//
//  MockURLProtocol.swift
//  PhotoAppTests
//
//  Created by Mykhailo Radzievskyi on 2023-05-16.
//  Copyright © 2023 Sergey Kargopolov. All rights reserved.
//

import Foundation

class MockURLProtocol: URLProtocol {
    static var stubResponseData: Data?
    static var error: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let signupError = MockURLProtocol.error {
            let error = NSError(domain: "testingError", code: -99, userInfo: [NSLocalizedDescriptionKey: signupError.localizedDescription])
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            self.client?.urlProtocol(self, didLoad: MockURLProtocol.stubResponseData ?? Data())
        }
        
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
        
    }
}
