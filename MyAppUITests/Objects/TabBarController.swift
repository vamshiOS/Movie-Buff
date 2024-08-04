//
//  TabBarController.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 04/08/24.
//

import Foundation
import XCTest

struct TabBarController{
    let app: XCUIApplication
    
    lazy var tabBar: XCUIElement = {
        app.tabBars["Tab Bar"]
    }()
    
    lazy var moviesTabBarItem: XCUIElement = {
        tabBar.buttons["Movies"]
    }()
    
    lazy var watchListTabBarItem: XCUIElement = {
        tabBar.buttons["Watch List"]
    }()
    
}
