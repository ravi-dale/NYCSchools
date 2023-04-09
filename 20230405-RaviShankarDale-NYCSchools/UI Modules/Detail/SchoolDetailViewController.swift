//
//  SchoolDetailViewController.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/6/23.
//

import MapKit
import UIKit

final class SchoolDetailViewController: UIViewController {
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var avgReadingScoreLabel: UILabel!
    @IBOutlet private weak var avgWritingScoreLabel: UILabel!
    @IBOutlet private weak var avgMathsScoreLabel: UILabel!
    @IBOutlet private weak var testTakersLabel: UILabel!

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var detailsContainerView: UIView!
    @IBOutlet private weak var dataNotAvailableLabel: UILabel!
    
    var viewModel: SchoolDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadData()
        self.mapView.layer.cornerRadius = 8.0
        self.detailsContainerView.layer.cornerRadius = 8.0
        self.detailsContainerView.layer.borderWidth = 1.0
        self.detailsContainerView.layer.borderColor = UIColor.gray.cgColor
        self.activityIndicator.startAnimating()
        self.viewModel.fetchSchoolDetail { [weak self] in
            self?.stopActivityIndicator()
            self?.updateUI()
        } failure: { [weak self] errMessage in
            self?.stopActivityIndicator()
            self?.showAlertWith(message: errMessage)
        }
    }
    
    private func loadData() {
        self.dataNotAvailableLabel.isHidden = true
        let school = self.viewModel.getSelectedSchool()
        self.nameLabel.text = school.name
        self.descriptionLabel.text = school.description
        self.loadLocationOnMapWith(locationData: school.getLocationCoordinates, addressTitle: school.address)
    }
    
    private func loadLocationOnMapWith(locationData: CLLocationCoordinate2D, addressTitle: String?) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = locationData
        let region = MKCoordinateRegion(center: locationData,
                                        span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        annotation.title = addressTitle
        self.mapView.setRegion(region, animated: true)
        self.mapView.addAnnotation(annotation)
        self.mapView.isUserInteractionEnabled = false
    }

    private func updateUI() {
        guard let details = self.viewModel.getSchoolDetails() else {
            self.updateUIForDataUnavailable()
            return
        }
        self.testTakersLabel.text = details.satTestTakers
        self.avgReadingScoreLabel.text = details.satAvgReadingScore
        self.avgWritingScoreLabel.text = details.satAvgWritingScore
        self.avgMathsScoreLabel.text = details.satAvgMathScore
    }
    
    private func updateUIForDataUnavailable() {
        self.dataNotAvailableLabel.isHidden = false
        self.detailsContainerView.layer.borderColor = UIColor.red.cgColor
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
    
    private func stopActivityIndicator() {
        self.activityIndicator.stopAnimating()
    }
}
