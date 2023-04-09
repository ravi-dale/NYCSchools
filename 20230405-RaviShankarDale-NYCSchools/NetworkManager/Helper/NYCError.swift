//
//  NYCError.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

struct NYCError: Error, LocalizedError, CustomStringConvertible {
    let code: NYCHTTPStatusCode
    var message: String
    
    init() {
        self.code = NYCHTTPStatusCode.generic
        self.message = self.code.message
    }
    
    init(code: Int, message: String? = nil) {
        self.code = NYCHTTPStatusCode(rawValue: code) ?? NYCHTTPStatusCode.generic
        self.message = message ?? self.code.message
    }
    
    var description: String {
        "Error Code: \(self.code), message: \(String(describing: self.message))"
    }
}

enum NYCHTTPStatusCode: Int, Error {
    case generic = 9000
    case badUrl = 9001
    case badResponse = 9002
    case parsingError = 9003
    
    var message: String {
        switch self {
        case .generic:
            return LocalizedStrings.Global.genericError
        case .badUrl:
            return LocalizedStrings.Global.badUrl
        case .badResponse:
            return LocalizedStrings.Global.badResponse
        case .parsingError:
            return LocalizedStrings.Global.parsingError
        }
    }
}
