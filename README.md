<img  align="left" src="http://estruyf-github.azurewebsites.net/api/VisitorHit?user=nitin-787&mynotes&countColorcountColor&countColor=%237B1E7B"/><img align="right" src="https://img.shields.io/github/repo-size/nitin-787/mynotes?style=for-the-badge&logo=appveyor" alt="GitHub repo size"/>
# Notes-Share 
<p align="center">

<img src="https://forthebadge.com/images/badges/built-with-love.svg" alt=" forks"/>
<img src="https://forthebadge.com/images/badges/built-by-developers.svg" alt=" forks"/>
<img src="https://forthebadge.com/images/badges/built-for-android.svg" alt=" forks"/>
<img src="https://forthebadge.com/images/badges/makes-people-smile.svg" alt=" forks"/>


</p>

## What is Notes-Share
Notes-Share is a media sharing app for students where students can share Assignments, notes, tutorials and other stuff in any format with fellow students publically specific to their institute or as in a private chat.
<br><br>
[![Download zip](https://custom-icon-badges.herokuapp.com/badge/-Download_Notes_Share-blue?style=for-the-badge&logo=download&logoColor=white "Download Notes-Share")](https://github.com/nitin-787/mynotes/releases/tag/v1.1.0)
## [Figma UI map](https://www.figma.com/file/gfaxLApOmJRt8lFrIRrWku/LPU-Share?node-id=0%3A1)  |  [Apk v1.1.0](https://github.com/nitin-787/mynotes/releases/tag/v1.1.0)



<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193436891-a57c69b8-aa4c-4943-8314-338a7521d90f.png" alt="Register Page" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193436935-cb90689e-e946-4f2f-8b07-5ff7bd9c710a.png" alt="Login Page" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193437013-0afc1ea3-cdfc-483d-90ae-069569595aee.png" alt="Public and Private wall" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193437042-11ea36c5-4f9f-46b3-8917-f4b861c059fa.png" alt="Search field usage" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193437066-4bb043a2-2c13-45e5-a64e-ec5c6d999a95.png" alt="Upload page" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193437096-e0272c31-63a4-4ff9-8148-1cfce00b6c1a.png" alt="Forgot Password" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193437137-a8788617-91db-4fcd-9122-c59ec905746d.png" alt="Mail verification" /></kbd>
<kbd><img width="216" height="432" src="https://user-images.githubusercontent.com/110724849/193437155-7b605e6c-8691-4e36-9301-05835ba326c8.png" alt="Private and Public wall" /></kbd>


## Features:
1) Create/Upload/Download Assignments, notes, tutorials etc,.
2) Removing  Attachments permanently.
3) Add some text/Note with Attachments. 
4) Add Comments, Send Email.
5) Searching/Indexing Files.
6) Timeline.
7) Google Authentication.


---


## Development
0) To run this Project first you need to [Setup Flutter](https://flutter.dev/docs/get-started/install)

1) Install packages<br/>
```sh
flutter pub get
```
2) Run the Project<br/>
```sh
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
