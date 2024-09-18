# Tanzania Safari App

Tanzania Safari is a Flutter-based mobile application that provides users with a comprehensive guide to exploring Tanzania's top attractions, including trips, hotels, restaurants, flights, and activities. This app is powered by Supabase for backend services, offering a seamless and interactive user experience.

## Features

- **Supabase Integration**: Utilizes Supabase as the backend service for data management and real-time updates.
- **Custom Theming**: Implements a custom theme with the Poppins font and a color palette inspired by Tanzania's natural beauty.
- **Onboarding Experience**: Includes an onboarding screen to welcome users and introduce them to the app's features.
- **Bottom Navigation Bar**: Provides easy navigation through different sections of the app: Home, Attractions, Stays, Culture, and Transports.
- **Dynamic Screens**: Offers multiple screens including Home, Trips, Hotels, Restaurants, Flights, and Activities, each fetching and displaying relevant data from Supabase.

## Screens

- **Home Screen**: The main entry point showcasing featured destinations and activities.
- **Trips Screen**: Displays various trip packages and attractions.
- **Hotels Screen**: Lists available accommodations with details fetched from Supabase.
- **Restaurants Screen**: Highlights top dining options in Tanzania.
- **Flights Screen**: Provides flight information and booking options.
- **Activities Screen**: Showcases popular activities and experiences in Tanzania.

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Supabase Account: [Sign up for Supabase](https://supabase.io)
- Google Fonts Package: [Add Google Fonts](https://pub.dev/packages/google_fonts)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/tanzania_safari.git
   ```
2. Navigate to the project directory:
   ```bash
   cd tanzania_safari
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### Setting Up Supabase

1. Create a new Supabase project at [Supabase](https://app.supabase.io/).
2. Get the API URL and anon key from the Supabase project settings.
3. Replace the placeholders in `main.dart` with your Supabase project details:
   ```dart
   await Supabase.initialize(
     url: 'https://your-supabase-url',
     anonKey: 'your-supabase-anon-key',
   );
   ```

### Running the App

- Start the app on an emulator or physical device:
  ```bash
  flutter run
  ```
![Alt text]()
## Customization

- **Theme**: Modify the app's theme by editing the `ThemeData` in `MyApp` class in `main.dart`.
- **Assets**: Add your custom icons and images in the `assets` directory and reference them in the code.
- **Routes**: Update the navigation routes or add new screens in the `routes` property of `MaterialApp`.

## Project Structure

- **lib/main.dart**: Entry point of the application.
- **lib/screens**: Contains the screen files for different sections of the app.
- **lib/models**: Define your data models here (if needed).
- **assets**: Stores images, icons, and other static resources.

## Dependencies

- `flutter`: Flutter framework.
- `supabase_flutter`: Supabase integration for Flutter.
- `google_fonts`: Access to Google Fonts in Flutter.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Supabase](https://supabase.io) for providing a powerful and easy-to-use backend solution.
- [Flutter](https://flutter.dev) for creating a versatile framework for mobile development.
- [Google Fonts](https://fonts.google.com) for the font assets.

## Contact

For any inquiries or feedback, feel free to reach out to jimmy.james365@gmail.com or jpmpanga@gmail.com.
