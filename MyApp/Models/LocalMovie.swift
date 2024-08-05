//
//  LocalMovie.swift
//  MyApp
//
//  Created by Vamshi Krishna Reddy Gurijala on 04/08/24.
//

import Foundation
import SwiftData


enum LocalMoviewError: LocalizedError {
    case movieAlreadyExist
    case couldNotDeleteMovie
    var errorDescription: String? {
        switch self {
            case .movieAlreadyExist:
                return "Movie already added to Watchlist"
        case .couldNotDeleteMovie:
            return "Failed to delete movie from the Watchlist"
        }
    }
}

@Model
 class LocalMovie{
    var _id: Int
    var backdrop_path: String
    var genres: [Genre]
    var original_title: String
    var overview: String
    var poster_path: String
    var release_date: String
    var title: String
    var contentType: String
    
    init(_id: Int, backdrop_path: String, genres: [Genre], original_title: String, overview: String, poster_path: String, release_date: String, title: String, contentType: String) {
        self._id = _id
        self.backdrop_path = backdrop_path
        self.genres = genres
        self.original_title = original_title
        self.overview = overview
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.contentType = contentType
    }
     
    func exists(context: ModelContext, id: Int) -> Bool {
         let predicate = #Predicate<LocalMovie> { $0._id == id }
         let descriptor = FetchDescriptor(predicate: predicate)
         
         do {
             let result = try context.fetch(descriptor)
             return !result.isEmpty ? true: false
         } catch {
             return false
         }
     }
     
     func fetchMovie(context: ModelContext, id: Int) -> LocalMovie? {
          let predicate = #Predicate<LocalMovie> { $0._id == id }
          let descriptor = FetchDescriptor(predicate: predicate)
          
          do {
              let result = try context.fetch(descriptor)
              return result.first
          } catch {
              return nil
          }
      }
     
     func save(context: ModelContext) throws {
         if !exists(context: context, id: self._id) {
             context.insert(self)
         } else {
             throw LocalMoviewError.movieAlreadyExist
         }
     }
     
     func delete(context: ModelContext) throws {
         if exists(context: context, id: self._id) {
             context.delete(self)
         } else {
             throw LocalMoviewError.couldNotDeleteMovie
         }
     }
}
