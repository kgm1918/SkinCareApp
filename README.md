SkinCareApp is an iOS application that helps users find a suitable skincare routine based on their skin needs.

The app includes a quiz that analyzes the user's answers and suggests an appropriate skincare routine. It also provides a list of skincare products loaded from a local JSON file.

## Features

- Take a skincare quiz
- Analyze user answers to suggest a skincare routine
- Browse a list of skincare products
- Load product data from a local JSON file
- Simple and clean SwiftUI interface

## Technologies

- Swift
- SwiftUI
- MVVM Architecture
- JSON parsing
- Xcode

## Architecture

The app uses the MVVM (Model–View–ViewModel) architecture pattern.

- Model – represents quiz data, skincare routine data, and product data
- View – handles the user interface using SwiftUI
- ViewModel – manages quiz logic, data flow, and prepares data for display

This architecture makes the code easier to maintain and scale.

## How It Works

1. The user completes a quiz about their skin type or concerns
2. The app analyzes the answers
3. A recommended skincare routine is shown
4. The user can also explore a predefined list of skincare products

## Data

The current version of the app uses a local JSON file to store skincare product data.

This approach was chosen to keep the project simple and focused on UI, app logic, and data handling.

## Future Improvements

- Add search functionality
- Add product filtering by skin type or concern
- Add favorites
- Connect the app to a real API
- Expand quiz logic for more personalized recommendations

## How to Run the Project

1. Clone the repository
2. Open the project in Xcode
3. Run the app on a simulator or a real device

## Author

GitHub: https://github.com/kgm1918
