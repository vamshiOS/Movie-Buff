//
//  MovieModel.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 31/07/24.
//

import Foundation

@MainActor
class MovieModel: ObservableObject{
    
    let webService: NetworkService
    
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var sections: [TableSection] = []

    init(webService: NetworkService) {
        self.webService = webService
    }
    
    func populateMovies() async throws{
        movies = try await webService.getMovies()
        sections = createTableSections(from: movies)
       
    }
    
    func createTableSections(from movies: [Movie]) -> [TableSection] {
        var sections: [TableSection] = []

        for genre in Genre.allCases {
            let filteredMovies = movies.filter { $0.genres.contains(genre) }
            if !filteredMovies.isEmpty {
                let section = TableSection(title: genre, items: filteredMovies)
                sections.append(section)
            }
        }

        return sections
    }
}





