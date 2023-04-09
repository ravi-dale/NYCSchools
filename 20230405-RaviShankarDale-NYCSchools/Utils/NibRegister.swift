//
//  NibRegister.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

protocol NibRegister {
    static var identifier: String { get }
    static var nibName: String { get }
}

extension NibRegister {
    static var identifier: String {
        String(describing: Self.self)
    }

    static var nibName: String {
        String(describing: Self.self)
    }
}
