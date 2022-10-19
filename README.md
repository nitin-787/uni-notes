# UNI-Share

### What is UNI-Share?

It not an another notes sharing app instead it have some powerfull feature which make the app stand out. UNI-Share is a media sharing app for student where student can share assignment, notes, tutorial, notice, etc in any format with fellow students publically specific to their institute or in a private chat.
If any students uploads a media content then all the students in a institute will get notified this we have done using firebase cloud messaging service.
Students can chat or share any other media in private chat room, and they will get realtime send, read, delivered receipt.

### Participating the Hacktoberfest?

Did I say the hacktoberfest, yes you heard me right it is participating the hacktoberfest 2022

To support the Hacktoberfest event, the hacktoberfest label will be added to every pull request made on 1 to 31 October 2022

### Let's prepare yourself!

![Hacktoberfest 2022](https://github.com/RajkumarSony/HacktoberFest2022/blob/main/logo.png)

### Why do i need to work this?

If you reach till here then I am pretty sure you have this question is in your mind why should I work on this project well, if you are flutter developer then this is perfect project for you, you will get to learn a lot of things about flutter like Bloc, state management, No internet activity, shimmer loading animation, flutter responsiveness, and different types of pakages and what not some additional things like Firebase, github CI/CD pipeline, google auth.

<br>

## [Figma UI map](https://www.figma.com/file/gfaxLApOmJRt8lFrIRrWku/LPU-Share?node-id=0%3A1) | [Apk v1.1.0](https://github.com/nitin-787/mynotes/releases/tag/v1.1.0)

## Contributers 🏆

<a href="https://github.com/nitin-787/myNotes/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nitin-787/myNotes" />
</a>

---

## Development

0. To run this Project first you need to [Setup Flutter](https://flutter.dev/docs/get-started/install)

1. Install packages<br/>

```sh
flutter pub get
```

2. Run the Project<br/>

```sh
flutter run
```

## Getting Started

### Make sure You have installed Firebase cli before starting the project

- To install the firebase cli - https://firebase.google.com/docs/cli#setup_update_cli / https://www.youtube.com/watch?v=dIK5MNvaxeY&t

- Setup firebase with flutter with the following commands:

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
