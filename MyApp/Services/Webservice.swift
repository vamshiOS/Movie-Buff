//
//  Webservice.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 31/07/24.
//

import Foundation
import Combine

enum NetworkError: Error{
    case badUrl
    case badRequest
    case decodingError
}


protocol NetworkService{
    func getMovies() async throws -> [Movie]
    func loadMovies(for searchText: String) -> AnyPublisher<[SearchedMovie], Error>
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
    
    func loadMovies(for searchText: String) -> AnyPublisher<[SearchedMovie], Error>{
        let url =  APIEndpoint.endPointURL(for: .searchMovies(searchText: searchText.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""))
       return URLSession.shared.dataTaskPublisher(for: url)
           .map(\.data)
           .decode(type: MoviesResponse.self, decoder: JSONDecoder())
           .map(\.Search)
           .receive(on: DispatchQueue.main)
           .catch { error -> AnyPublisher<[SearchedMovie], Error> in
               return Just([]).setFailureType(to: Error.self).eraseToAnyPublisher()
           }.eraseToAnyPublisher()
   }
    
//    func getMovieDetails(for id: String) -> AnyPublisher<SearchedMovie, Error>{
//    //https://www.omdbapi.com/?i=tt0468569&apiKey=b0e187ad
//    }

}
