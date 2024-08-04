//
//  MyAppTests.swift
//  MyAppTests
//
//  Created by Vamshi Krishna Reddy Gurijala on 30/07/24.
//

import XCTest
@testable import MyApp
import SwiftData


final class MyAppUnitTests: XCTestCase {
    var model: MovieModel!
    var mockService: MockWebservice!
    var context: ModelContext!
    @MainActor
     override func setUp() {
        mockService = MockWebservice()
         model =  MovieModel(webService: mockService!)
         context = mockContainer.mainContext
         
    }
    
    func testFetchMovies() async throws {
        try await model.populateMovies()
        await MainActor.run {
                    XCTAssertFalse(model.movies.isEmpty)
                    XCTAssertFalse(model.sections.isEmpty)
                }
    }
    func testCreateSections() async throws{
        let movies = [Movie(_id: 0, backdrop_path: "", genres: [.actionAndAdventure, .romance], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: ""),
                      Movie(_id: 1, backdrop_path: "", genres: [.actionAndAdventure, .comedy], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: ""),
                      Movie(_id: 2, backdrop_path: "", genres: [.drama, .history], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: "")]
        let sections =   await model.createTableSections(from: movies)
        XCTAssertEqual(sections.count, 5)
    }
    
    func testAddingMovieToWatchList(){
        let localMovie = LocalMovie(_id: 11, backdrop_path: "", genres: [.comedy], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: "")
        try! localMovie.save(context: context)
        XCTAssertTrue(localMovie.exists(context: context, id: 11))
    }
    
    func testDeletingMovieFromWatchList(){
        let localMovie = LocalMovie(_id: 13, backdrop_path: "", genres: [.romance], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: "")
        try! localMovie.save(context: context)
        XCTAssertTrue(localMovie.exists(context: context, id: 13))
        
        try! localMovie.delete(context: context)
        XCTAssertFalse(localMovie.exists(context: context, id: 13))

    }
    
    func testTitleExceptionWhenADuplicateMovieIsAdded(){
        
        let localMovie = LocalMovie(_id: 12, backdrop_path: "", genres: [.actionAndAdventure], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: "")
        try! localMovie.save(context: context)
        
        let duplicateMovie = LocalMovie(_id: 12, backdrop_path: "", genres: [.actionAndAdventure], original_title: "", overview: "", poster_path: "", release_date: "", title: "", contentType: "")
        XCTAssertThrowsError(try duplicateMovie.save(context: context), "No exception found"){error in
            let thrownError = error as? LocalMoviewError
            XCTAssertNotNil(thrownError)
            XCTAssertEqual(LocalMoviewError.movieAlreadyExist, thrownError)
        }
    }
    
    override func tearDown() {
        model = nil
        mockService = nil
        context = nil
        super.tearDown()
    }

}

