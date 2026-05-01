# Flutter API Integration with BLoC

A Flutter project demonstrating API integration using BLoC (Business Logic Component) state management, following a clean and modular architecture.

## Architecture

The project follows a modular structure where each feature is isolated into its own module. It uses the BLoC pattern to separate the presentation layer from the business logic.

### Layers

- **Core**: Contains app-wide constants, themes, network configurations, and common widgets.
- **Data**: Responsible for data fetching from external sources (API) and local storage.
  - **Models**: Data transfer objects for API responses.
  - **Providers**: Direct interaction with the network (e.g., using Dio).
  - **Repositories**: Implementation of domain repositories that coordinate data flow between providers and the rest of the app.
- **Domain**: Contains the core business logic of the application.
  - **Entities**: Business objects used throughout the app.
  - **Repositories**: Abstract definitions of data operations.
- **Modules**: Feature-based modules containing:
  - **Bloc**: Manages state and events for the feature.
  - **View**: UI components that react to BLoC states.
- **Routes**: Manages application navigation and route definitions.

## Key Technologies

- **flutter_bloc**: For predictable state management.
- **dio**: For making HTTP requests.
- **equatable**: For value-based equality in states and events.
- **cached_network_image**: For efficient image loading and caching.

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the application

## Project Structure

```text
lib/
├── core/
│   ├── network/
│   ├── theme/
│   └── widgets/
├── data/
│   ├── models/
│   ├── providers/
│   └── repositories/
├── domain/
│   ├── entities/
│   └── repositories/
├── modules/
│   ├── home/
│   │   ├── bloc/
│   │   └── view/
│   └── movie_detail/
│       ├── bloc/
│       └── view/
├── routes/
└── main.dart
```