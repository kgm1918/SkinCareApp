# SkinCareApp

SkinCareApp is an iOS application designed to help users build a skincare routine based on their individual skin needs.

The app includes an interactive quiz that analyzes user input and provides a routine recommendation. In addition, users can browse skincare products loaded from a local JSON file.

## Features

- Interactive skincare quiz
- Routine recommendation based on quiz results
- Product catalog
- Local JSON data parsing
- Clean and user-friendly interface

## Tech Stack

- Swift
- SwiftUI
- MVVM
- JSON
- Xcode

## Architecture

This project follows the **MVVM** architecture pattern to separate UI, business logic, and data models.

## Testing

The onboarding quiz logic is covered by 25 unit tests written with Swift Testing,
including parameterised tests. They run on every push via GitHub Actions.

## Demo

<img src="skincareapp.gif" width="200">

## Future Improvements

- API integration
- Search and filtering
- Favorites
- Better personalization logic
