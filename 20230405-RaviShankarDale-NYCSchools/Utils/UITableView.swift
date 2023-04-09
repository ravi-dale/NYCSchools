//
//  UITableView.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(cell ofType: T.Type) where T: NibRegister {
        self.register(UINib(nibName: ofType.nibName, bundle: Bundle(for: ofType.self)), forCellReuseIdentifier: ofType.identifier)
    }
    
    func dequeue<T: UITableViewCell>(cell ofType: T.Type, at indexPath: IndexPath) -> T where T: NibRegister {
        self.dequeueReusableCell(withIdentifier: ofType.identifier, for: indexPath) as! T
    }
}
