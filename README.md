# login_system

This Flutter project serves as a test to showcase my proficiency in Flutter app development. The project incorporates the Clean Architecture and BLoC pattern, with Auto Route handling the routing within the application. Please note that the API request to the designated endpoint refuses to connect, but in the event of a failure, there is a redirection to the home route for design purposes.

## Getting Started

To run this Flutter project on your local machine, follow the steps below:

### Prerequisites

Make sure you have Flutter installed on your machine. You can find the installation instructions on the official Flutter website: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)

### Clone the Repository

First, clone this repository to your local machine using Git or by downloading the ZIP file.

```
git clone https://github.com/Smart-Java/coding-test.git
```

### Install Dependencies

Navigate to the project's root directory and execute the following command in the terminal to get the required dependencies:

```
flutter pub get
```

### Run the Application

Connect your device or start an emulator, then run the following command to launch the application:

```
flutter run
```

## Project Structure

The project follows the Clean Architecture principles to ensure separation of concerns and maintainability. The folder structure is organized as follows:

- `lib`: Contains the main application code.
  - `app`: Defines the application
  - `data`: Handles data-related operations, such as API calls and data caching.
  - `domain`: Defines the business logic and entities of the application.
  - `presentation`: Implements the UI layer, including screens, widgets, and BLoC.
  - `infrastructure`: Defines the routes and navigation using the Auto Route package, configs and contains utility functions and helper classes..

## Clean Architecture and BLoC Pattern

Clean Architecture is used to separate the application into layers with clear boundaries, enabling easier testing and maintenance. The architecture consists of three main layers:

- `Data Layer`: Responsible for handling data access, including API calls and data caching. It resides in the `data` folder.
- `Domain Layer`: Contains the business logic and entities of the application. It resides in the `domain` folder.
- `Presentation Layer`: Implements the UI layer, including screens, widgets, and BLoC. It resides in the `presentation` folder.

The BLoC (Business Logic Component) pattern is used to manage the state and handle interactions within the application. The BLoC classes reside in the `presentation` folder and communicate with the UI to provide data and manage user actions.

## Technologies and Packages Used
The project utilizes the following technologies and packages:

- Flutter: A cross-platform UI toolkit for building natively compiled applications.
- Auto Route: A package for declarative routing and navigation in Flutter.
- Bloc: A predictable state management library that helps manage the application state.
- Dio: A powerful HTTP client for Dart that handles API requests.
- GetIt: A simple dependency injection package for managing dependencies.
- Equatable: A package that makes it easy to implement equality in Dart.

## Note on API Request Failure
Please note that the API request to the endpoint specified in the code may fail to connect. However, in case of a request failure, the application is designed to redirect the user to the home route to provide a seamless user experience. This is handled within the application's error handling logic.

To modify the API endpoint or handle request failures differently, you can update the corresponding code in the data layer or the BLoC responsible for making the API request.

## Auto Route

Auto Route is a package used for declarative routing in Flutter applications. It simplifies the navigation and routing setup by generating code based on route configurations. The route configurations are defined in the `routes` folder. Auto Route takes care of handling the redirection to the home route in case of API request failures.

## APK
Here is the link to the generated APK for this test project: https://drive.google.com/drive/folders/1bis83J00UCGE1x-xU67lBoCHflv8WTI5

## Conclusion

This Flutter test project demonstrates my proficiency in Flutter app development, showcasing the implementation of Clean Architecture, the BLoC pattern, and the usage of Auto Route for navigation. Although the API request to the designated endpoint refuses to connect, the application handles the failure gracefully by redirecting to the home route. Feel free to explore the code and reach out if you have any questions or feedback.