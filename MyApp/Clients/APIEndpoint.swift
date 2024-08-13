//
//  APIEndpoint.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 02/08/24.
//

import Foundation


enum APIEndpoint{
    
    static let baseURL = "https://movies-api14.p.rapidapi.com"
    static let imdbBaseURL = "https://www.omdbapi.com/"

    case allMovies
    case searchMovies(searchText: String)
    case getMovieDetails(id: String)
    private var path: String{
        switch self{
        case .allMovies:
            return "/movie"
        case .searchMovies(let searchText):
            return "?s=\(searchText)&apiKey=\(Constants.Keys.imdbKey)"
        case .getMovieDetails(let id):
            return "?i=\(id)apiKey=\((Constants.Keys.imdbKey))"
        }
    }
    
    static func endPointURL(for endPoint: APIEndpoint) -> URL{
        let path = endPoint.path
        switch endPoint{
        case .allMovies:
            return URL(string: baseURL + path)!
        default:
            return URL(string: imdbBaseURL + path)!
        }
    }
}
