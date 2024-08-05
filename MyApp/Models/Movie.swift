//
//  Movie.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 31/07/24.
//

import Foundation
import SwiftData



enum Genre: String, Codable, CaseIterable{
    case actionAndAdventure = "Action & Adventure"
    case romance = "Romance"
    case thriller = "Thriller"
    case horror = "Horror"
    case mystery = "Mystery"
    case crime = "Crime"
    case drama = "Drama"
    case war = "War"
    case family = "Family"
    case sciFiAndFantasy = "Sci-Fi & Fantasy"
    case animation = "Animation"
    case comedy = "Comedy"
    case music = "Music"
    case history = "History"
}

struct Movies: Codable, Hashable{
    let movies: [Movie]
}

struct Movie: Codable, Identifiable, Hashable{
    var id: Int{
        return _id;
    }
    let _id: Int
    let backdrop_path: String
    let genres: [Genre]
    let original_title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let title: String
    let contentType: String
}

struct TableSection: Identifiable, Hashable {
    let id = UUID()
    let title: Genre
    let items: [Movie]
}




