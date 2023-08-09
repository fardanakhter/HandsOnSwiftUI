//
//  DataLoader.swift
//  Landmarks
//
//  Created by Fardan Akhter on 12/07/2023.
//

import Foundation

class DataLoader {
    static func load<T: Decodable>(from file: String) -> T {
        var data: Data
        
        guard let url = Bundle.main.url(forResource: file, withExtension: nil) else {
            fatalError("No file found with name \(file)")
        }
        
        do {
            data = try Data(contentsOf: url)
        }
        catch {
            fatalError("Data cannot be read from \(file) file")
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        }
        catch {
            fatalError("Data present in \(file) file cannot be decoded into \(type(of: T.self)) type")
        }
    }
}
