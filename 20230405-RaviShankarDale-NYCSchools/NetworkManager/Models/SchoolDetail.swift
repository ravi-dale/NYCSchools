//
//  SchoolDetail.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/6/23.
//

import Foundation

struct DetailsList: Codable {
    let list: [Details]?

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.list = try container.decode([Details].self)
    }
}

struct Details: Codable {
    let dbn: String?
    let schoolName: String?
    let satTestTakers: String?
    let satAvgReadingScore: String?
    let satAvgWritingScore: String?
    let satAvgMathScore: String?

    enum CodingKeys: String, CodingKey {
        case schoolName = "school_name"
        case satTestTakers = "num_of_sat_test_takers"
        case satAvgReadingScore = "sat_critical_reading_avg_score"
        case satAvgWritingScore = "sat_writing_avg_score"
        case satAvgMathScore = "sat_math_avg_score"
        case dbn
    }
}
