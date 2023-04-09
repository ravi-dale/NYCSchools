//
//  Constants.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

///  strings which are used in code  should be organized in constants/
struct Constants {
    /// Storyboard Constants
    struct Storyboards {
        static let main = "Main"
    }
    
    struct SchoolApiType {
        static let baseUrl = "https://data.cityofnewyork.us/"
        static let listPath = "resource/s3k6-pzi2.json?$limit=50"
        static let detailsPath = "resource/f9bf-2cp4.json?dbn=%@"
    }
}
