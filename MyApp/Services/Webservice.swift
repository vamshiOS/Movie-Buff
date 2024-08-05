//
//  Webservice.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 31/07/24.
//

import Foundation

enum NetworkError: Error{
    case badUrl
    case badRequest
    case decodingError
}


protocol NetworkService{
    func getMovies() async throws -> [Movie]
}

class Webservice: NetworkService{
    func getMovies() async throws -> [Movie]{
        
        print("URL : \(APIEndpoint.endPointURL(for: .allMovies))")
        var request = URLRequest(url: APIEndpoint.endPointURL(for: .allMovies))
        request.httpMethod = "GET"
        request.setValue(Constants.Keys.rapidAPIValue, forHTTPHeaderField: Constants.rapidAPIHeader)
       let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpUrlResponse = response as? HTTPURLResponse, httpUrlResponse.statusCode == 200 else{
            throw NetworkError.badRequest
        }
        
        guard let movies = try? JSONDecoder().decode(Movies.self, from: data) else{
            throw NetworkError.decodingError
        }
        return movies.movies
    }
}
