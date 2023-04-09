//
//  RequestResponseManager.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

class RequestResponseManager: RequestResponseProtocol {
    let baseUrl: String

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func request<T>(api: NYCHttpApi, completion: @escaping (Result<T, NYCError>) -> Void) where T : Decodable {
        let apiURLStr = "\(self.baseUrl)\(api.path)"
        guard let url = URL(string: apiURLStr) else {
            DispatchQueue.main.async {
                completion(.failure(NYCError(code: NYCHTTPStatusCode.badUrl.rawValue)))
            }
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = api.method.rawValue
        do {
            urlRequest.httpBody = try api.body()
        } catch {
            print("Body encoding failed error: \(error.localizedDescription)")
        }

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else {
                completion(.failure(NYCError(code: NYCHTTPStatusCode.badResponse.rawValue)))
                return
            }
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
        }.resume()
    }
}
