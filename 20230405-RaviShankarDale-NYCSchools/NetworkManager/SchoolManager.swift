//
//  SchoolManager.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation


/// This is an extra layer to fetch data from network or persistant store
/// This can also be used to modify data and persist in database
final class SchoolManager {

    lazy var newtorkManager: RequestResponseProtocol = RequestResponseManager(baseUrl: Constants.SchoolApiType.baseUrl)

    func fetchSchoolList(completion: @escaping (Result<SchoolList, NYCError>) -> Void) {
        self.newtorkManager.request(api: SchoolApiType.schoolList, completion: completion)
    }
    
    func fetchSchoolDetail(for id: String, completion: @escaping (Result<DetailsList, NYCError>) -> Void) {
        self.newtorkManager.request(api: SchoolApiType.schooldDetail(dbn: id), completion: completion)
    }
}
