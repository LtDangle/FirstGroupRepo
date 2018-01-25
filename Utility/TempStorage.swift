//
//  TempStorage.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit

class TempStorage {
    private init(){}
    static let manager = TempStorage()
    
    private let sharedCache = NSCache<NSString, UIImage>()
    
    public func getCachedImage(url: URL) -> UIImage? {
        return sharedCache.object(forKey: url.absoluteString as NSString)
    }
    
    func processImageInBackground(imageURL: URL, completion: @escaping(Error?, UIImage?) -> Void) {
        DispatchQueue.global().async {
            do {
                let imageData = try Data.init(contentsOf: imageURL)
                let image = UIImage.init(data: imageData)
                
                // store image in cache
                if let image = image {
                    self.sharedCache.setObject(image, forKey: imageURL.absoluteString as NSString)
                }
                
                
                completion(nil, image)
            } catch {
                print("image processing error: \(error.localizedDescription)")
                completion(error, nil)
            }
        }
    }
}
