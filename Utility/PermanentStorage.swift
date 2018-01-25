//
//  PermanentStorage.swift
//  Unit5FirstGroupProject
//
//  Created by C4Q on 1/23/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import UIKit

class PermanentStorage {
    private init(){}
    static let manager = PermanentStorage()
    
    static let pathname = "imageURLS"
    // model
    private var imageUrls = [URL]() {
        didSet {
            saveToDisk()
        }
    }
    
    private func docsDir() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    private func dataFilePath(withPathName path: String) -> URL {
        return docsDir().appendingPathComponent(path)
    }
    
    private func saveToDisk() {
        do {
            let data = try PropertyListEncoder().encode(imageUrls)
            try data.write(to: dataFilePath(withPathName: PermanentStorage.pathname), options: .atomic)
        } catch {
            print(error)
        }
    }
    
    private func loadFromDisk() {
        do {
            let data = try Data.init(contentsOf: dataFilePath(withPathName: PermanentStorage.pathname))
            imageUrls = try PropertyListDecoder().decode([URL].self, from: data)
        } catch {
            print(error)
        }
    }
    
    public func getImage(withURL urlStr: String) throws -> UIImage {
        guard let url = URL(string: urlStr) else {
            // TODO: figure out what to do if bad urlStr
            throw AppError.badURL
        }
        var data: Data
        do {
            data = try Data(contentsOf: dataFilePath(withPathName: urlStr))
        } catch {
            throw AppError.noImageAtURL
        }
        
        guard let image = UIImage(data: data) else {
            throw AppError.noImageAtURL
        }
        return image
    }
    
    public func store(image: UIImage, withURL urlStr: String) {
        guard let imageData = UIImagePNGRepresentation(image) else {
            print("couldn't turn image into data")
            return
        }
        
        guard let url = URL(string: urlStr) else {
            print("couldn't turn into url: \(urlStr)")
            return
        }
        
        do {
            try imageData.write(to: dataFilePath(withPathName: urlStr))
            imageUrls.append(url)
            
        } catch {
            print("couldn't store image with url: \(urlStr)")
        }
    }
}
