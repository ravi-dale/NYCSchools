//
//  SchoolListViewController.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

final class SchoolListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    // This is force unwrapped as this needs to be set from coordinator while initializing this controller
    var viewModel: SchoolListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(cell: SchoolListCell.self)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.viewModel.fetchSchoolList { [weak self] in
            self?.tableView.reloadData()
        } failure: { [weak self] errMessage in
            self?.showAlertWith(message: errMessage)
        }
    }
    
    private func showAlertWith(message: String) {
        let alertController = UIAlertController(title: LocalizedStrings.Global.updateFailed,
                                                message: message,
                                                preferredStyle: .alert)
        let alertCancelAction = UIAlertAction(title: LocalizedStrings.Global.ok,
                                              style: UIAlertAction.Style.default)
        alertController.addAction(alertCancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension SchoolListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.getSchoolList().count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: SchoolListCell.self, at: indexPath)
        let schoolModel = self.viewModel.getSchoolAt(index: indexPath.row)
        cell.configure(school: schoolModel)
        return cell
    }
}

extension SchoolListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let schoolModel = self.viewModel.getSchoolAt(index: indexPath.row)
        self.viewModel.didSelectSchool?(schoolModel)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
