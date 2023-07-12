//
//  DataLoader.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import Foundation

var landmarks: [LandmarkViewModel] = {
    (try? DataLoader<[Landmark]>.load(from: "landmarkData.json").map{LandmarkViewModel($0)}) ?? []
}()

class DataLoader<T: Decodable> {
    static func load(from file: String) throws -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            throw NSError(domain: "No file found with name \(file)", code: 0)
        }
        
        guard let data = try? Data(contentsOf: url) else {
            throw NSError(domain: "Data cannot be read from \(file) file", code: 0)
        }
        
        guard let model = try? JSONDecoder().decode(T.self, from: data) else {
            throw NSError(domain: "Data present in \(file) file cannot be decoded into \(type(of: T.self)) type", code: 0)
        }
        
        return model
    }
}
