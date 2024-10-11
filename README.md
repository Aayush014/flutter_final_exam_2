# ToDo App

### A user-friendly to-do application with offline capabilities, Firebase integration, and authentication.

## Features

- **Offline Support**: Add tasks even when offline, and they will automatically sync with Firebase once an internet connection is available.
- **Firebase Integration**: Uses Firebase Realtime Database for syncing to-dos across devices.
- **Firebase Authentication**: Secure login system that allows users to manage their tasks after authentication.
- **CRUD Operations**:
  - **Create**: Add new to-do tasks.
  - **Read**: View your tasks, organized and displayed with check/uncheck functionality.
  - **Update**: Modify the content of tasks as needed.
  - **Delete**: Remove tasks when completed or no longer needed.
- **User-friendly Interface**: Clean and intuitive design to easily manage tasks.
- **Task Status**: Check or uncheck tasks based on their completion status.

## Tech Stack

- **Frontend**: Flutter (for a responsive and cross-platform user interface)
- **Backend**: Firebase Realtime Database (for real-time task synchronization)
- **Authentication**: Firebase Authentication (for secure login and user management)
- **Storage**: Local storage for offline task management

<details> 
  <summary><h2>📸Photos & Video</h2></summary>
  <p>
    <table align="center">
  <tr>
    <td><img src="https://github.com/user-attachments/assets/c4d093af-56b8-4aa9-bcbc-6098cb6d2aef" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/1a69448c-7ff8-499e-b037-6f9f706f34ae" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/1205eb14-f81e-4101-b778-5de15aa81492" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/190cb3ea-b89a-4c7e-839e-0ef6a6c8959a" alt="Image 2" width="180" height="auto"></td>
    <td><img src="https://github.com/user-attachments/assets/e7ca7577-fba9-4411-aa52-a92a1db5c951" alt="Image 2" width="180" height="auto"></td>
    </table>    
  </p>
  </details>

## Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/todo-app.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd todo-app
   ```
3. **Install dependencies**:
   ```bash
   flutter pub get
   ```
4. **Configure Firebase**:
   - Add your `google-services.json` (for Android) or `GoogleService-Info.plist` (for iOS) to the appropriate directory.
   - Make sure you have set up Firebase Realtime Database and Firebase Authentication in your Firebase project.

5. **Run the app**:
   ```bash
   flutter run
   ```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request.
