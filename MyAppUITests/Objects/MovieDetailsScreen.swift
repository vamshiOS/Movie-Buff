//
//  MovieDetailsScreen.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 04/08/24.
//

import Foundation
import XCTest

struct MovieDetailsScreen{
    let app: XCUIApplication
    
    lazy var wishListButton: XCUIElement = {
        app.buttons[Constants.Identifiers.addToWatchListButton]
    }()
    
    lazy var backToMoviesListButton: XCUIElement = {
        app/*@START_MENU_TOKEN@*/.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]/*[[".otherElements[\"lol\"].navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]",".navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.buttons["Movies"]
    }()
    
}
