//
//  SchoolList.swift
//  20230405-RaviShankarDale-NYCSchools
//
//  Created by Ravi Shankar Dale on 4/5/23.
//

import MapKit

struct SchoolList: Codable {
    var schools: [School] = []

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.schools = try container.decode([School].self)
    }
}

struct School: Codable {
    let name: String?
    let description: String?
    let dbn: String?
    let location: String?
    let zip: String?
    let city: String?
    let phoneNumber: String?
    let website: String?
    let latitude: String?
    let longitude: String?

    var address: String? {
        self.location?.components(separatedBy: "(").first
    }

    var getLocationCoordinates: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: Double(self.latitude ?? "0.0") ?? 0.0,
                               longitude: Double(self.longitude ?? "0.0") ?? 0.0)
    }

    enum CodingKeys: String, CodingKey {
        case name = "school_name"
        case description = "overview_paragraph"
        case location
        case zip
        case city
        case dbn
        case phoneNumber = "phone_number"
        case website
        case latitude
        case longitude
    }
}
