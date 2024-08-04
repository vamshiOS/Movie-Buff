//
//  MockWebservice.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import Foundation


class MockWebservice: NetworkService{
    func getMovies() async throws -> [Movie] {
        return PreviewData.load(resourceName: "movies")
    }
}
