//
//  FourSquareModel.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct FoursquareResults: Codable {
    let meta: Meta
    let response: DataResponse
}

struct Meta: Codable {
    let code: Int
    let requestID: String
}

struct DataResponse: Codable {
    let venues: [Venue]
}

struct Venue: Codable {
    let id: String
    let name: String
    let contact: Contact
    let location: Position
    let verified: Bool
    let url: String?
    let hasMenu: Bool?
    let menu: Menu?
    let venuePage: VenuePage?
}

struct Contact: Codable {
    let phone: String
    let formattedPhone: String
    let twitter: String
    let instagram: String
    let facebook: String
    let facebookUsername: String
    let facebookName: String
}

struct Position: Codable {
    let address: String
    let crossStreet: String
    let lat: Double
    let lng: Double
    let labeledLatLngs: [LabeledLatLng]
    let postalCode: String
    let cc: String
    let city: String
    let state: String
    let country: String
    let formattedAddress: [String]
}

struct LabeledLatLng: Codable {
    let label: String
    let lat: Double
    let lng: Double
}

struct Menu: Codable {
    let type: String
    let label: String
    let anchor: String
    let url: String
    let mobileURL: String
}

struct VenuePage: Codable {
    let id: String
}
