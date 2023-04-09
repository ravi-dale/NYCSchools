//
//  SchoolCoordinator.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

final class SchoolCoordinator: ChildCoordinator {

    weak var parentCoordinator: ParentCoordinator?
    var navigationController: UINavigationController
    private let schoolManager: SchoolManager

    init(with navigationController: UINavigationController, schoolManager: SchoolManager) {
        self.navigationController = navigationController
        self.schoolManager = schoolManager
    }

    func configureChildViewController() {
        let schoolListVC = Storyboardable<SchoolListViewController>.main.instantiate
        let viewModel = SchoolListViewModel(manager: self.schoolManager)
        viewModel.didSelectSchool = { [weak self] school in
            self?.navigateToDetailPage(with: school)
        }
        schoolListVC.viewModel = viewModel
        self.navigationController.setViewControllers([schoolListVC], animated: true)
    }

    func navigateToDetailPage(with schoolModel: School) {
        let schoolDetailVC = Storyboardable<SchoolDetailViewController>.main.instantiate
        let viewModel = SchoolDetailViewModel(manager: self.schoolManager, school: schoolModel)
        schoolDetailVC.viewModel = viewModel
        self.navigationController.pushViewController(schoolDetailVC, animated: true)
    }
}
