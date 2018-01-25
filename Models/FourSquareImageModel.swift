//
//  FourSquareImageModel.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

struct ImageResponse: Codable {
    let response: Response
}

struct Response: Codable {
    let photos: Photos
}

struct Photos: Codable {
    let count: Int
    let items: [PhotosItem]
}

struct PhotosItem: Codable {
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
}
