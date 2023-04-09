//
//  Dictionary.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

extension Dictionary {
    func encodedJsonData() throws -> Data? {
        guard let jsonData = try? JSONSerialization.data(withJSONObject: self, options: .fragmentsAllowed) else {
            return nil
        }
        let jsonString = String(data: jsonData, encoding: .utf8)
        return jsonString?.data(using: .utf8)
    }
}
