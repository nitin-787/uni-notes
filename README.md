# mynotes

A new Flutter project.

This project is a starting point for a Flutter application.

## Note: My Master branch and the most recent Branch will be same!

## Development Setup
Clone the repository and run the following commands:
```
flutter pub get
flutter run
```

## Getting Started

### Make sure You have installed Firebase cli before starting the project
 * To install the firebase cli -  https://firebase.google.com/docs/cli#setup_update_cli / https://www.youtube.com/watch?v=dIK5MNvaxeY&t
 
 * Setup firebase with flutter with the following commands:
 ```
 firebase login
 dart pub global activate flutterfire_cli
 ```
 ### Configure your apps to use Firebase
```
 your-flutter-proj$ flutterfire configure (select your project or create a new one)
 ```
 
  ### Note: If just created a new firebase account this command will not work for you've to create a firebase project manually on your account
  After creating a project, go inside it and click on authentication -> a sign-in method tab and add provider email/password and enable email/password
  
  ### Initialize Firebase in your app
```
  your-flutter-proj$ flutter pub add firebase_core
  your-flutter-proj$ flutterfire configure
```  
  
  * Add 4 dependencies
  ```
  flutter pub add firebase_core
  flutter pub add firebase_auth
  flutter pub add cloud_firestore
  flutter pub add firebase_analytics
  ```
  
  In your pubspec.yaml this 4 plugin will be added Bcuz of above 4 commands
  
  * firebase_core: ^1.18.0
  * firebase_auth: ^3.3.20
  * cloud_firestore: ^3.1.18
  * firebase_analytics: ^9.1.10
