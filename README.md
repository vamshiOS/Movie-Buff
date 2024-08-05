# Movie Buff
Movie Buff is a SwiftUI-based iOS application that allows users to browse a list of movies, view detailed information about each movie, and manage their personal watchlist. The app leverages modern SwiftUI features and SwiftData for local data storage.

## Features
- Browse a list of movies fetched from a network API
- View detailed information about each movie
- Add movies to a personal watchlist
- Remove movies from the watchlist
- Offline support with local data storage

## Screenshots
<img src="https://res.cloudinary.com/do5h20gi0/image/upload/v1722837933/Simulator_Screenshot_-_Clone_1_of_iPhone_15_Pro_-_2024-08-05_at_11.34.27_b2eqxp.png" width="250" /> <img src="https://res.cloudinary.com/do5h20gi0/image/upload/v1722837928/Simulator_Screenshot_-_Clone_1_of_iPhone_15_Pro_-_2024-08-05_at_11.34.35_zczcrk.png" width="250" />
<img src="https://res.cloudinary.com/do5h20gi0/image/upload/v1722837931/Simulator_Screenshot_-_Clone_1_of_iPhone_15_Pro_-_2024-08-05_at_11.35.09_jldftf.png" width="250" />
<img src="https://res.cloudinary.com/do5h20gi0/image/upload/v1722838895/Simulator_Screenshot_-_iPhone_15_Pro_-_2024-08-05_at_11.50.59_acxkjp.png" width="250" />

## Architecture
The Movie Buff app is built using the MV (includes aggregate model, webservice and server) architecture pattern, which helps in separating the concerns and making the code more modular and testable.

## Testing
- Unit tests are written using the XCTest framework to test the business logic in view models and services.
- UI tests are also written using the XCTest framework to test the user interface and navigation flows.

## Tech Stack 
- [SwiftUI](https://developer.apple.com/xcode/swiftui/) - For building the user interface.
- [MV Architecture](https://betterprogramming.pub/swiftui-architecture-a-complete-guide-to-mv-pattern-approach-5f411eaaaf9e) - To separate concerns and enhance testability.
- [SwiftData](https://developer.apple.com/xcode/swiftdata/) - For local data storage.
- [URLSession](https://developer.apple.com/documentation/foundation/urlsession) - For network requests.
- [XCTest](https://developer.apple.com/documentation/xctest) - For unit and UI testing.
  
