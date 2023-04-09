//
//  SchoolListViewModel.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import Foundation

final class SchoolListViewModel {
    var didSelectSchool: ((School) -> Void)?
    private let manager: SchoolManager
    private var schools: [School] = []

    init(manager: SchoolManager) {
        self.manager = manager
    }
    
    func getSchoolList() -> [School] {
        self.schools
    }

    func getSchoolAt(index: Int) -> School {
        self.schools[index]
    }

    func fetchSchoolList(success: @escaping (() -> Void), failure: @escaping ((String) -> Void)) {
        self.manager.fetchSchoolList { [weak self] response in
            switch response {
            case .failure(let error):
                // Returning the error message directly here, we can modify the error message based on error code and return user friendly message if given more time
                failure(error.message)
            case .success(let result):
                self?.schools = result.schools
                success()
            }
        }
    }
}
