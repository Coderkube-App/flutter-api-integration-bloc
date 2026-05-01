# Flutter API Integration with BLoC

A Flutter project demonstrating API integration using BLoC (Business Logic Component) state management, following a clean and modular architecture.

---

## Features

* Fetch and display movie details
* Scalable API integration using Dio
* Predictable state management with BLoC
* Clean and modular project structure
* Centralized API handling (interceptors, logging)
* Optimized network calls and image caching

---

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

---

## Getting Started

### 1. Clone the repository

```bash
git clone <your-repo-url>
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## API Key Setup (IMPORTANT)

This project uses the TMDB API.

* You must add your own API key before running the project.

### Steps:

* Create an account on TMDB
* Generate your API key
* Open the file:

```text
lib/core/network/api_endpoints.dart
```

* Add your API key:

```dart
class ApiEndpoints {
  static const String baseUrl = 'https://api.themoviedb.org/3';

  static const String apiKey = 'YOUR_API_KEY_HERE';
}
```

---

## Tech Stack

* Flutter
* Dart
* Dio (HTTP client)
* flutter_bloc (State management)
* equatable (Value equality)
* cached_network_image (Image loading)

---

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

---

## Notes

* Do not commit your API key to public repositories
* If API calls fail, check:
    * Internet connection
    * API key validity
    * Rate limits

---

## Best Practices Used

* BLoC pattern for separation of presentation and business logic
* Singleton Dio client
* Interceptors for logging and request handling
* Separation of concerns (API, UI, Models, Blocs)
* Reusable network layer

---

## Future Improvements

* Search movies
* Favorites or Watchlist
* Movie trailers
* Dark mode support

---

## Contribution

* Feel free to fork and improve this project
* Pull requests are welcome

---

## License

* This project is licensed under the Apache-2.0 License.