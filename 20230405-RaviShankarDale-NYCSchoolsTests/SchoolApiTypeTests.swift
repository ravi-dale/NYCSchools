//
//  SchoolApiTypeTests.swift
//  20230405-RaviShankarDale-NYCSchoolsTests
//
//  Created by Ravi Shankar Dale on 4/9/23.
//

import XCTest
@testable import _0230405_RaviShankarDale_NYCSchools

final class SchoolApiTypeTests: XCTestCase {

    func testSchoolList() throws {
        let listType = SchoolApiType.schoolList
        XCTAssertEqual(listType.path, "resource/s3k6-pzi2.json?$limit=50")
        XCTAssertEqual(listType.method.rawValue, "GET")
    }
    
    func testSchoolDetail() throws {
        let listType = SchoolApiType.schooldDetail(dbn: "abcd")
        XCTAssertEqual(listType.path, "resource/f9bf-2cp4.json?dbn=abcd")
        XCTAssertEqual(listType.method.rawValue, "GET")
    }
}
