//
//  PreviewData.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import Foundation


class PreviewData{
    static func load<T: Decodable>(resourceName: String) -> T{
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "json") else{
            fatalError("Resource \(resourceName) doesn't exist")
        }
        
        let data = try! Data(contentsOf: URL(filePath: path))
        return try! JSONDecoder().decode(T.self, from: data)
    }
}
