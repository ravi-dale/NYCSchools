//
//  Storyboardable.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

/// Storyboard Enum which take ViewController class name as genrics.
/// ViewController is the Genirc declaration.
enum Storyboardable<ViewController> {
    case main

    /// Variable which returns the storyboard name
    var storyboardName: String {
        switch self {
        case .main:
            return Constants.Storyboards.main
        }
    }

    /// Returns the ViewController identifier using the class name generic.
    var identifier: String {
        String(describing: ViewController.self)
    }
    
    var instantiate: ViewController {
        let storyboard = UIStoryboard(name: self.storyboardName, bundle: .main)
        return storyboard.instantiateViewController(withIdentifier: String(describing: ViewController.self)) as! ViewController
    }
}
