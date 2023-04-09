//
//  SchoolApiType.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

enum SchoolApiType: NYCHttpApi {

    case schoolList
    case schooldDetail(dbn: String)

    var apiName: String {
        switch self {
        case .schoolList:
            return "Get School List"
        case .schooldDetail(let schoolId):
            return "Get details for \(schoolId)"
        }
    }
    
    var path: String {
        switch self {
        case .schoolList:
            //https://data.cityofnewyork.us/Education/DOE-High-School-Directory-2017/s3k6-pzi2
            //Given more time, prefer to do pagination
            return Constants.SchoolApiType.listPath
        case .schooldDetail(let schoolId):
            //https://data.cityofnewyork.us/Education/SAT-Results/f9bf-2cp4
            return String(format: Constants.SchoolApiType.detailsPath, schoolId)
        }
    }
    
    var method: HTTPMethod {
        .get
    }
}
