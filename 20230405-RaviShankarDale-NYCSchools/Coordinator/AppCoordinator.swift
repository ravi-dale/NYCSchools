//
//  AppCoordinator.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

final class AppCoordinator: ParentCoordinator {

    var navigationController: UINavigationController
    var childCoordinators: [ChildCoordinator] = [ChildCoordinator]()

    init(with navigationController : UINavigationController) {
        self.navigationController = navigationController
    }

    lazy var schoolManager = SchoolManager()

    func configureRootViewController() {
        let coordinator = SchoolCoordinator(with: self.navigationController,
                                            schoolManager: self.schoolManager)
        self.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = self
        coordinator.configureChildViewController()
    }

    func removeChildCoordinator(child: ChildCoordinator) {
        for(index, coordinator) in self.childCoordinators.enumerated() {
            if coordinator === child {
                self.childCoordinators.remove(at: index)
                break
            }
        }
    }
}
