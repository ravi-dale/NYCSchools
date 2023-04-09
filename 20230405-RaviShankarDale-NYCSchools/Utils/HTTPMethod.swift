//
//  HTTPMethod.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

// Using struct instead of enum so that this can be extended with more methods
struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    /// `GET` method.
    static let get = HTTPMethod(rawValue: "GET")
    /// `POST` method.
    static let post = HTTPMethod(rawValue: "POST")

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
