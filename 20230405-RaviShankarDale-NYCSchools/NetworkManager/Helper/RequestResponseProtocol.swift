//
//  RequestResponseProtocol.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

protocol RequestResponseProtocol: AnyObject {
    var baseUrl: String { get }

    func request<T: Decodable>(api: NYCHttpApi, completion: @escaping (Result<T, NYCError>) -> Void)
}
