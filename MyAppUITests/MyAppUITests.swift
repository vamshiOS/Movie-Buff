//
//  MyAppUITests.swift
//  MyAppUITests
//
//  Created by Vamshi Krishna Reddy Gurijala on 30/07/24.
//

import XCTest

final class MyAppUITests: XCTestCase {
    
    private var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITEST"]
        app.launch()
    }
    
    func testUserSelectionOfMovieAndAddingItToWatchListAndNavigateBack(){
        
        var tabController = TabBarController(app: app)
        
        var moviesListScreen = MoviesListScreen(app: app)
        
        var movieDetailsScreen = MovieDetailsScreen(app: app)
        
        var watchListScreen = WatchListScreen(app: app)


        //switch to watchlist tab
        tabController.watchListTabBarItem.tap()
        
        //check if list is empty
        XCTAssertTrue(watchListScreen.findSomethingButton.exists)
        
        //switch back to movies tab
        tabController.moviesTabBarItem.tap()
        
        //Swipe up and down
        moviesListScreen.moviesListView.swipeUp()
        moviesListScreen.moviesListView.swipeDown()

        //tap on the second item of first row
        let secondCellInFirstRow =  moviesListScreen.movieCell(for: 0, cell: 1)
        secondCellInFirstRow.tap()
        
        //click on Add to Wishlist button
        movieDetailsScreen.wishListButton.tap()
        
        //check if title has changed to Remove from Watchlist
        XCTAssertTrue(movieDetailsScreen.wishListButton.label == Constants.removeFromWatchListTitle)
        
        //click on Remove from Watchlist button
        movieDetailsScreen.wishListButton.tap()

        //check if title has changed to Add To Wishlist
        XCTAssertTrue(movieDetailsScreen.wishListButton.label == Constants.addToWatchListButtonTitle)


        //Add Movie to WishList
        movieDetailsScreen.wishListButton.tap()
        
        
        //Switch to Watchlist tab again
        tabController.watchListTabBarItem.tap()
        
        //Check if the movie has been added to Wishlist
        XCTAssertTrue(app.collectionViews.staticTexts["AKA"].exists)
        
        //Swipe the row left and perform delete operqation
        let firstRowInWatchList = watchListScreen.watchListItem(row: 0)
        firstRowInWatchList.swipeLeft()
        watchListScreen.deleteButton.tap()
        
        //Check if the list is empty
        XCTAssertTrue(watchListScreen.findSomethingButton.exists)

        //Switch to Movies Tab again
        tabController.moviesTabBarItem.tap()
        
        //Check if the button title has changed to Add To Wishlist
        XCTAssertTrue(movieDetailsScreen.wishListButton.label == Constants.addToWatchListButtonTitle)

    }
  
    func testSwipe(){
        var moviesListScreen = MoviesListScreen(app: app)

        

    }
    
}


