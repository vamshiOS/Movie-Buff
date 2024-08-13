//
//  MoviesResponse.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 05/08/24.
//

import Foundation

struct MoviesResponse: Decodable{
    let Search: [SearchedMovie]
}

struct SearchedMovie: Identifiable, Decodable{
    let title: String
    let year: String
    let imdbID: String
    let poster: String
    var id: String{
        return imdbID
    }
    
    enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case poster = "Poster"

    }
}

//struct IMDBMovieDetails: Identifiable, Decodable{
//    
//}
//
//{
//    "Title": "The Dark Knight",
//    "Year": "2008",
//    "Rated": "PG-13",
//    "Released": "18 Jul 2008",
//    "Runtime": "152 min",
//    "Genre": "Action, Crime, Drama",
//    "Director": "Christopher Nolan",
//    "Writer": "Jonathan Nolan, Christopher Nolan, David S. Goyer",
//    "Actors": "Christian Bale, Heath Ledger, Aaron Eckhart",
//    "Plot": "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
//    "Language": "English, Mandarin",
//    "Country": "United States, United Kingdom",
//    "Awards": "Won 2 Oscars. 164 wins & 164 nominations total",
//    "Poster": "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_SX300.jpg",
//    "Ratings": [
//        {
//            "Source": "Internet Movie Database",
//            "Value": "9.0/10"
//        },
//        {
//            "Source": "Rotten Tomatoes",
//            "Value": "94%"
//        },
//        {
//            "Source": "Metacritic",
//            "Value": "84/100"
//        }
//    ],
//    "Metascore": "84",
//    "imdbRating": "9.0",
//    "imdbVotes": "2,896,249",
//    "imdbID": "tt0468569",
//    "Type": "movie",
//    "DVD": "N/A",
//    "BoxOffice": "$534,987,076",
//    "Production": "N/A",
//    "Website": "N/A",
//    "Response": "True"
//}
