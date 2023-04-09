//
//  Coordinator.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
}

protocol ParentCoordinator: Coordinator {
    var childCoordinators: [ChildCoordinator] { get set } // Holds all the child coordinators that are derived from parent
    func configureRootViewController()// Initialize a child coordinator
    func removeChildCoordinator(child: ChildCoordinator) // To remove a child controller when we are done with particular flow
}

protocol ChildCoordinator: Coordinator {
    var parentCoordinator: ParentCoordinator? { get set }
    func configureChildViewController() // Initialize a View Controller
}
