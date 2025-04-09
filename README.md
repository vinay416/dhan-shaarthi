**Overview**

The DhanSaarthi project is a Flutter-based mobile application that utilizes BLoC (Business Logic Component) for state management, Supabase for authentication, and local storage for persistent data. The application follows Clean Architecture principles and employs Test-Driven Development (TDD) to ensure high-quality, maintainable code.

![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 33 03](https://github.com/user-attachments/assets/78bd7bc3-d8df-4408-adc3-25a54a3d1f26)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 48 54](https://github.com/user-attachments/assets/7220bb22-a650-4c6e-8ce0-50dbf4860591)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 48 46](https://github.com/user-attachments/assets/01995a2d-9791-44d7-a56d-d0ef78cb378d)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 48 41](https://github.com/user-attachments/assets/c6eb09ff-c748-474c-ae4d-eef67fa494c8)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 46 38](https://github.com/user-attachments/assets/16234ed8-0395-4650-a4d5-352762476ba8)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 46 33](https://github.com/user-attachments/assets/e5bc43d2-4176-4bb4-99da-26bd3a32d368)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 46 25](https://github.com/user-attachments/assets/7817b96a-bb9a-4b16-8b51-a51380dd8016)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 46 11](https://github.com/user-attachments/assets/1868a51c-697b-4c73-a52c-2c3a15aa5b9a)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 46 04](https://github.com/user-attachments/assets/1521679b-ce8e-4223-ac89-0edd4336a7c5)
![Simulator Screenshot - iPhone 16 Pro - 2025-04-09 at 10 45 42](https://github.com/user-attachments/assets/ad493594-32c5-48cc-8e03-57bbab2f68c0)


The primary features of this app include:

Login/Signup with phone number authentication and OTP (One-Time Password).

Line and Bar Charts for visual representation of financial data.

Watchlist for adding/removing favorite funds to track and manage investment preferences.

**Features**

Login/Signup: Users can sign up and log in using their phone number and receive an OTP for authentication.

Charts: The app showcases line and bar charts to visualize financial data for a better understanding of fund trends.

Watchlist: Users can add/remove funds to/from their watchlist for easy tracking of their favorite investments.

**Technologies Used**

Flutter: A popular framework for building natively compiled applications for mobile, web, and desktop.

BLoC: A state management library in Flutter used to separate business logic from UI.

Supabase: An open-source Firebase alternative used for authentication, database, and storage.

Local Storage: Data persistence is handled using local storage for offline functionality.

Clean Architecture: A layered architecture that promotes separation of concerns and high maintainability.

TDD (Test-Driven Development): Unit and widget tests are written before the actual implementation of features, ensuring the reliability and quality of the code.

**Setup Instructions**

Prerequisites
Flutter: Ensure that you have Flutter installed on your machine. You can check the official Flutter installation guide for detailed steps.

Supabase: You will need a Supabase account and project for authentication. Visit Supabase to create a project.

**Project Structure**

Directory Overview

lib/
│
├── core/                # Core utilities and resources
│   ├── errors/          # Error handling classes
│   ├── usecases/        # Business logic use cases
│   ├── utils/           # Utility functions
│
├── features/            # Features of the app (e.g., authentication, charting, etc.)
│   ├── auth/            # Authentication (Login/Signup)
│   ├── charts/          # Line and Bar Charts
│   ├── watchlist/       # Watchlist functionality
│
├── main.dart            # Entry point of the application
├── routes.dart          # Routing configuration
├── constants.dart       # Constant values (e.g., API keys, etc.)
├── widgets/             # Reusable widgets
│
test/                    # Test directory
│

***********************************
Authentication Flow (Login/Signup)
Phone Number Authentication: The app uses Supabase's phone number authentication to handle user sign-in/signup with OTP.

Login Screen: The user inputs their phone number, receives an OTP via SMS, and is authenticated.

Signup Screen: If the user does not exist, they can create a new account with phone number and OTP.

Watchlist
Users can add or remove funds to/from their watchlist for tracking.

The list of added funds is stored locally for offline access.

Charts
Line Chart: Displays the performance of a fund over time.

Bar Chart: Displays fund data in a bar chart format to compare different funds.

Clean Architecture
The project is organized according to Clean Architecture principles, which ensures a well-structured and maintainable codebase:

Presentation Layer: UI code that communicates with BLoC for state management.

Domain Layer: Contains business logic and use cases.

Data Layer: Handles data sources (Supabase, Local Storage).

Testing
The project follows Test-Driven Development (TDD) where tests are written before the implementation. Unit tests for features such as authentication, chart rendering, and watchlist operations are included.
