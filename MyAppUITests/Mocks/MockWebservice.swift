//
//  MockWebservice.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 01/08/24.
//

import Foundation
import Combine


class MockWebservice: NetworkService{
    func loadMovies(for searchText: String) -> AnyPublisher<[SearchedMovie], any Error> {
        return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
    }
    
    
    func getMovies() async throws -> [Movie] {
        return PreviewData.load(resourceName: "movies")
    }
}
