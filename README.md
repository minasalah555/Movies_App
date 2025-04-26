🎬 Flutter Movies App
A beautiful and functional Flutter app that allows users to browse and discover movies. Built using clean architecture and state management best practices.

✨ Features
🔹 Top Rated Movies – Explore critically acclaimed movies
🔥 Popular Movies – See what’s trending worldwide
🎥 Upcoming Movies – Stay updated with future releases
🔍 Search Functionality – Find any movie by name
📄 Movie Details Page – View full info including:

Poster & backdrop

Title & release date

Rating

Overview

Language and more

🛠 Tech Stack
Flutter – For cross-platform development

Dart – Primary programming language

BLoC & Cubit – For efficient, scalable state management

TMDB API – To fetch real-time movie data

Dio – For handling API requests

Clean Architecture – For modular and maintainable code

📱 Screenshots
(Add screenshots of your app here to showcase the UI)

🚀 Getting Started
Clone the repo

bash
Copy
Edit
git clone https://github.com/your-username/flutter-movies-app.git
Get packages

bash
Copy
Edit
flutter pub get
Run the app

bash
Copy
Edit
flutter run
🌐 API Key
This app uses TMDB API.
To make it work, you’ll need your own API key from The Movie Database (TMDB).

Create a .env or use a constants file

Add your TMDB API key

dart
Copy
Edit
const String apiKey = "YOUR_API_KEY_HERE";
📦 Project Structure
css
Copy
Edit
lib/
│
├── core/
├── data/
├── domain/
├── presentation/
├── ui/
└── main.dart
Following Clean Architecture with separation of concerns and reusable components.

🧠 Learnings
This project helped me improve my understanding of:

BLoC/Cubit state management

API integration using Dio

Building scalable Flutter apps

Organizing code with clean architecture

⭐ Feedback
If you like the project, feel free to star it 🌟 and share your suggestions or contributions!
