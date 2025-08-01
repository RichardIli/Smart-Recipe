# Smart Recipe App

Smart Recipe App is a cross-platform Flutter application designed to make your cooking journey smarter and easier. Whether you’re a home cook or a food enthusiast, this app helps you discover, search, and manage recipes tailored to your preferences and available ingredients. With a modern UI, robust state management, and seamless user experience, Smart Recipe App is your personal kitchen assistant.

![Smart Recipe Demo](assets/SmartRecipe.gif)

## Description

Smart Recipe App empowers users to:
- **Discover new recipes** every day with personalized daily inspirations.
- **Search for recipes** by name, category, or available ingredients in your fridge.
- **Manage your ingredients** and instantly get suggestions for what you can cook.
- **Save your favorite recipes** for quick access anytime.
- **Enjoy a beautiful and responsive UI** with custom app bars, shimmer loading effects, and friendly error handling.
- **Experience smooth performance** thanks to Bloc/Cubit state management and a clean, scalable architecture.

Whether you want to reduce food waste, try something new, or just make meal planning easier, Smart Recipe App is here to help!

## Features

- **Search Recipes:** Find recipes by name, category, or ingredients.
- **Daily Inspiration:** Get daily recommended recipes.
- **Ingredient Management:** Add ingredients from your fridge and get recipe suggestions.
- **Favorites:** Save and manage your favorite recipes.
- **Beautiful UI:** Custom app bar, shimmer loading, and responsive layouts.
- **Error Handling:** Friendly error messages and retry options.
- **State Management:** Uses Bloc and Cubit for scalable state handling.
- **Theming:** Customizable color palette and theme support.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- A device or emulator (iOS, Android, or Web)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/RichardIli/Smart-Recipe.git or git@github.com:RichardIli/Smart-Recipe.git
   cd smart_recipe_app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Set up environment variables:**
   - Create a `.env` file in the project root (and in the `web/` folder for Flutter Web).
   - Add your API endpoints:
     ```
     GENERATE_RECIPE_API_ENDPOINT=your_api_endpoint
     GENERATE_DAILY_RECIPE_API_ENDPOINT=your_api_endpoint
     GENERATE_RECIPE_BY_NAME_API_ENDPOINT=your_api_endpoint
     GENERATE_RECIPE_BY_CATEGORY_API_ENDPOINT=your_api_endpoint
     ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
  Blocs/                # Bloc and Cubit state management
  Models/               # Data models (e.g., Recipe)
  Repositories/         # API and data repositories
  Screens/              # UI screens
  SharedComponents/     # Reusable widgets
  Themes/               # App theming
  routes/               # App routing
  main.dart             # App entry point
assets/
  SmartRecipe.gif       # Demo GIF
```

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [http](https://pub.dev/packages/http)
- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv)
- [shimmer](https://pub.dev/packages/shimmer)
- [page_transition](https://pub.dev/packages/page_transition)
- [mobkit_dashed_border](https://pub.dev/packages/mobkit_dashed_border)

---

**Happy Cooking! 🍳**