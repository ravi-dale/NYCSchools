//
//  SchoolManagerTests.swift
//  20230405-RaviShankarDale-NYCSchoolsTests
//
//  Created by Ravi Shankar Dale on 4/9/23.
//

import XCTest
@testable import _0230405_RaviShankarDale_NYCSchools

final class SchoolManagerTests: XCTestCase {

    var schoolManager: SchoolManager?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.schoolManager = SchoolManager()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        self.schoolManager = nil
    }
    
    func testGetSchoolsListSuccess() {
        let promise = expectation(description: "School List: 50")
        self.schoolManager?.newtorkManager = MockSchoolListRequestResponseManager(baseUrl: Constants.SchoolApiType.baseUrl)
        self.schoolManager?.fetchSchoolList(completion: { response in
            switch response {
            case .failure(let error):
                XCTAssertNil(error, "Request shouldn't fail")
                promise.fulfill()
            case .success(let result):
                XCTAssertEqual(result.schools.count, 50)
                promise.fulfill()
            }
        })
        wait(for: [promise], timeout: 5)
    }
    
    func testGetSchoolsListFailure() {
        let promise = expectation(description: "School List: 50")
        self.schoolManager?.newtorkManager = MockFailureRequestResponseManager(baseUrl: Constants.SchoolApiType.baseUrl)
        self.schoolManager?.fetchSchoolList(completion: { response in
            switch response {
            case .failure(let error):
                XCTAssertEqual(error.code, NYCHTTPStatusCode.parsingError)
                promise.fulfill()
            case .success(let result):
                XCTAssertNil(result, "Request should fail")
                promise.fulfill()
            }
        })
        wait(for: [promise], timeout: 5)
    }

    func testGetSchoolsDetailSuccess() {
        let promise = expectation(description: "School Details to be present")
        self.schoolManager?.newtorkManager = MockSchoolDetailRequestResponseManager(baseUrl: Constants.SchoolApiType.baseUrl)
        self.schoolManager?.fetchSchoolDetail(for: "21K728", completion: { response in
            switch response {
            case .failure(let error):
                XCTAssertNil(error, "Request shouldn't fail")
                promise.fulfill()
            case .success(let result):
                XCTAssertEqual(result.list?.first?.satAvgMathScore, "369")
                XCTAssertEqual(result.list?.first?.satAvgWritingScore, "373")
                XCTAssertEqual(result.list?.first?.satAvgReadingScore, "411")
                promise.fulfill()
            }
        })
        wait(for: [promise], timeout: 5)
    }
    
    func testGetSchoolsDetailFailure() {
        let promise = expectation(description: "School Details to be present")
        self.schoolManager?.newtorkManager = MockFailureRequestResponseManager(baseUrl: Constants.SchoolApiType.baseUrl)
        self.schoolManager?.fetchSchoolDetail(for: "21K728", completion: { response in
            switch response {
            case .failure(let error):
                XCTAssertEqual(error.code, NYCHTTPStatusCode.parsingError)
                promise.fulfill()
            case .success(let result):
                XCTAssertNil(result, "Request should fail")
                promise.fulfill()
            }
        })
        wait(for: [promise], timeout: 5)
    }
}
