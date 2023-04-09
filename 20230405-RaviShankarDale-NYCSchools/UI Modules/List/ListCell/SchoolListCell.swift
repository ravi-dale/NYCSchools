//
//  SchoolListCell.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import UIKit

final class SchoolListCell: UITableViewCell, NibRegister {
 
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var numberTextView: UITextView!
    @IBOutlet private weak var websiteTextView: UITextView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = ""
        self.descriptionLabel.text = ""
        self.numberTextView.text = ""
        self.websiteTextView.text = ""
    }

    func configure(school: School) {
        self.nameLabel.text = school.name
        self.descriptionLabel.text = school.description
        self.numberTextView.text = school.phoneNumber
        self.websiteTextView.text = school.website
    }
}
