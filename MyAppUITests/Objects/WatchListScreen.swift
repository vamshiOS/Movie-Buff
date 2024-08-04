//
//  WatchListScreen.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 04/08/24.
//

import Foundation
import XCTest

struct WatchListScreen{
    let app: XCUIApplication
    
    func watchListItem(row: Int) -> XCUIElement{
       return app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: row).children(matching: .other).element
    }
    
    lazy var findSomethingButton: XCUIElement = {
        app.buttons[Constants.findSomething]
    }()
     
    lazy var deleteButton: XCUIElement = {
        app.collectionViews.buttons["Delete"]
    }()
}
