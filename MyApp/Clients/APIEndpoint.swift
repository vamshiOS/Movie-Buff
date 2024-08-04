//
//  APIEndpoint.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 02/08/24.
//

import Foundation


enum APIEndpoint{
    
    static let baseURL = "https://movies-api14.p.rapidapi.com"
    
    case allMovies
    
    private var path: String{
        switch self{
        case .allMovies:
            return "/movies"
        }
    }
    
    static func endPointURL(for endPoint: APIEndpoint) -> URL{
        let path = endPoint.path
        return URL(string: baseURL + path)!
    }
}
