//
//  NYCHttpApi.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

/// NYCHttpApi: All Network request parameters can be abstracted by conforming to this protocol. It also conforms to CustomStringConvertible to print all parameter details. All parameters are only having
protocol NYCHttpApi: CustomStringConvertible {
    /// This is the name of the Request which will be used during logging
    var apiName: String { get }

    /// This is the path of the API call that gets added to the base URL
    var path: String { get }

    /// Type of method that needs to be used for API call
    var method: HTTPMethod { get }

    /// All the headers that needs to be used in the API call
    var headers: [String: String]? { get }

    /// All the parameterrs that need to added to URL as query parrameters
    var parameters: [String: Any]? { get }

    /// Parameters that needs to be passed in body of API call
    var bodyParameters: [String: Any]? { get }
    
    /// The function which constructs the body in required format for the API
    func body() throws -> Data?
}

extension NYCHttpApi {
    var description: String {
        "\(self.apiName): , path: \(self.path), method: \(self.method), headers: \(String(describing: self.headers)), parameters: \(String(describing: self.parameters)), bodyParameters: \(String(describing: self.bodyParameters))"
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var parameters: [String: Any]? {
        return nil
    }
    
    var bodyParameters: [String: Any]? {
        return nil
    }
    
    func body() throws -> Data? {
        try self.bodyParameters?.encodedJsonData()
    }
}
