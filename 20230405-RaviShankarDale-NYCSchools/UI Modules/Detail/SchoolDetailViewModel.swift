//
//  SchoolDetailViewModel.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/6/23.
//

import Foundation

final class SchoolDetailViewModel {
    private let manager: SchoolManager
    private let selectedSchool: School
    private var deatils: Details?

    init(manager: SchoolManager, school: School) {
        self.manager = manager
        self.selectedSchool = school
    }
    
    func getSchoolDetails() -> Details? {
        self.deatils
    }
    
    func getSelectedSchool() -> School {
        self.selectedSchool
    }

    func fetchSchoolDetail(success: @escaping (() -> Void), failure: @escaping ((String) -> Void)) {
        self.manager.fetchSchoolDetail(for: self.selectedSchool.dbn!) { [weak self] response in
            switch response {
            case .failure(let error):
                // Returning the error message directly here, we can modify the error message based on error code and return user friendly message if given more time
                failure(error.message)
            case .success(let result):
                self?.deatils = result.list?.first
                success()
            }
        }
    }
}
