//
//  MockRequestResponseManager.swift
//  20230405-RaviShankarDale-NYCSchoolsTests
//
//  Created by Ravi Shankar Dale on 4/9/23.
//

import XCTest
@testable import _0230405_RaviShankarDale_NYCSchools

final class MockSchoolListRequestResponseManager: RequestResponseProtocol {

    let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func request<T>(api: NYCHttpApi, completion: @escaping (Result<T, NYCError>) -> Void) where T : Decodable {
        guard let asset = NSDataAsset(name: "SchoolList", bundle: Bundle(for: MockSchoolListRequestResponseManager.self)) else {
            fatalError("Missing data asset: deviceToken Response")
        }
        let data = asset.data
        if let model = try? JSONDecoder().decode(T.self, from: data) {
            //print("Log: Response data is \(model)")
            DispatchQueue.main.async {
                completion(.success(model))
            }
        } else {
            DispatchQueue.main.async {
                completion(.failure(NYCError(code: NYCHTTPStatusCode.parsingError.rawValue)))
            }
        }
    }
}

final class MockFailureRequestResponseManager: RequestResponseProtocol {

    let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func request<T>(api: NYCHttpApi, completion: @escaping (Result<T, NYCError>) -> Void) where T : Decodable {
        guard let asset = NSDataAsset(name: "Failure", bundle: Bundle(for: MockFailureRequestResponseManager.self)) else {
            fatalError("Missing data asset: deviceToken Response")
        }
        let data = asset.data
        if let model = try? JSONDecoder().decode(T.self, from: data) {
            //print("Log: Response data is \(model)")
            DispatchQueue.main.async {
                completion(.success(model))
            }
        } else {
            DispatchQueue.main.async {
                completion(.failure(NYCError(code: NYCHTTPStatusCode.parsingError.rawValue)))
            }
        }
    }
}

final class MockSchoolDetailRequestResponseManager: RequestResponseProtocol {

    let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func request<T>(api: NYCHttpApi, completion: @escaping (Result<T, NYCError>) -> Void) where T : Decodable {
        guard let asset = NSDataAsset(name: "SchoolDetail", bundle: Bundle(for: MockSchoolDetailRequestResponseManager.self)) else {
            fatalError("Missing data asset: deviceToken Response")
        }
        let data = asset.data
        if let model = try? JSONDecoder().decode(T.self, from: data) {
            //print("Log: Response data is \(model)")
            DispatchQueue.main.async {
                completion(.success(model))
            }
        } else {
            DispatchQueue.main.async {
                completion(.failure(NYCError(code: NYCHTTPStatusCode.parsingError.rawValue)))
            }
        }
    }
}
