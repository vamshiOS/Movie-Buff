//
//  MoviesListScreen.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 02/08/24.
//

import Foundation
import XCTest


struct MoviesListScreen{
    
    let app: XCUIApplication
    
    
    func movieCell(for row: Int, cell: Int) -> XCUIElement{
        return app.collectionViews.children(matching: .cell).element(boundBy: row).scrollViews.otherElements.children(matching: .button).element(boundBy: cell)
    }
    
    lazy var moviesListView: XCUIElement = {
        app.collectionViews[Constants.Identifiers.moviesList]
    }()
    
}


