//
//  ImageAPIClient.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

import UIKit

struct ImageAPIClient {
    private init () {}
    static let manager = ImageAPIClient()
    
    func getImage(urlStr: String, completionHandler: @escaping (UIImage) -> Void, errrorHandler: @escaping (Error) -> Void) {
        guard let url = URL(string: urlStr) else { errrorHandler(AppError.badURL); return }
        let request = URLRequest(url: url)
        let completion: (Data) -> Void = {(data: Data) in
            guard let onlineImage = UIImage(data: data) else { errrorHandler(AppError.notAnImage); return }
            completionHandler(onlineImage)
        }
        NetworkHelper.manager.performDataTask(with: request, completionHandler: completion, errorHandler: errrorHandler)
    }
}
