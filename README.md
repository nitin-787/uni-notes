# UNI-Share | Hacktober Fest 2022

![](/hacktober2022.png)

**This repository is a part of the Hacktober Fest 2022** 🥳

# About the Project
The overflow of multiple shared documents across various platforms amongst students is an evergreen problem.

UNI-Share, a media sharing app, that aims to help students share the following but not limited to: 

&rarr; assignment <br/>
&rarr; notes <br/>
&rarr; tutorial <br/>
&rarr; notice <br/>

In any format with fellow students, either publically specific to their institute or in a private chat. 

The project is supported by Firebase Clund Messaging Service at the backend.

# Tech Stack

* [Flutter](https://flutter.dev/)
* [Firebase](https://firebase.google.com/)
* [Dart](https://dart.dev/)
* [Android Studio](https://developer.android.com/studio)

> Checkout the UI map [HERE](https://www.figma.com/file/gfaxLApOmJRt8lFrIRrWku/LPU-Share?node-id=0%3A1) <br/>
> APK v1.1.0 [HERE](https://github.com/nitin-787/mynotes/releases/tag/v1.1.0)

# Getting Started 

Make **sure** you have installed Firebase cli before starting the project setup.

Firebase Documentation: <br/>
https://firebase.google.com/docs/cli#setup_update_cli

Alternatively you could look into this YouTube video for futher help for the Firebase Setup:
https://www.youtube.com/watch?v=dIK5MNvaxeY&t

#### Setup firebase with flutter with the following commands:
  ```
  firebase login
  dart pub global activate flutterfire_cli
  ```
#### Configure your apps to use Firebase

```bash
 your-flutter-proj$ flutterfire configure (select your project or create a new one)
```

---
1. To download and install the Firebase CLI run the following command:
    ```bash
    npm install -g firebase-tools
    ```

2. Create a Firebase project

    ```bash
    firebase login
    firebase init
    ```

3. Add Firebase config to your project

4. Run the app
    ```bash
    flutter run
    ```


# Development Setup 

1. Clone the repository
    ```bash
    git clone
    ```

2. Install dependencies
    ```bash
    flutter pub get
    ```

3. Run the app
    ```bash
    flutter run
    ```
> NOTE: If you've just created a new firebase account this command will not work for you. You will have to create a firebase project manually on your account <br/>
After creating a project, go inside it<br/>
&rarr; Click on authentication &rarr; a sign-in method tab &rarr; add provider email/password &rarr; enable email/password

### Initialize Firebase in your app

```
  your-flutter-proj$ flutter pub add firebase_core
  your-flutter-proj$ flutterfire configure
```

# About Hacktoberfest?
Hactoberfest is Digitalocean's annual flagship event that encourage people to contribute to open source prject throughout the month of October every year.

This year, 2022, is the 9th chapter of Hacktober Fest.
By making 4 accepted PRs (Pull Requests) in the month of October 2022, you are eligible for a free-tshirt and swags from Hacktoberfest!

So what are you waiting for? <br/>
Fork this project and start contributing! :)

To know more about Hacktober Fest, visit their website.
Link [here.](https://hacktoberfest.com/)

> NOTE: PRs made before or after this time, will not be considered.


# How to contribute?

If you want to contribute to this project then you can fork this project and then you can create a pull request.

**1.** Fork [this](https://github.com/nitin-787/mynotes) repository   
**2.**  Clone your forked copy of the project.

```
git clone https://github.com/<your_username>/mynotes.git
```

**3.** Navigate to the project directory :file_folder: .

```
cd mynotes
```

**4.** Add a reference(remote) to the original repository.

```
git remote add upstream https://github.com/anjali1102/mynotes.git
```

**5.** Check the remotes for this repository.
```
git remote -v
```

**6.** Always take a pull from the upstream repository to your master branch to keep it at par with the main project(updated repository).

```
git pull upstream main
```

**7.** Create a new branch.

```
git checkout -b <your_branch_name>
```

**8.** Perfom your desired changes to the code base.
**9.** Track your changes:heavy_check_mark: .

```
git add . 
```

**10.** Commit your changes .

```
git commit -m "Relevant message"
```

**11.** Push the committed changes in your feature branch to your remote repo.
```
git push -u origin <your_branch_name>
```
**12.** To create a pull request, click on `Compare and pull requests`. Please ensure you compare your feature branch to the desired branch of the repo you are suppose to make a PR to.

**13.** Add appropriate title and description to your pull request explaining your changes and efforts done.

**14.** Click on `Create Pull Request`.

**15.** Voila! You have made a PR to the awesome-developer-portfolio project. Sit back patiently and relax while the your PR is reviewed. This may take sometime. 

> Look into CONTRIBUTING.md for further clarifications

# Project Maintainer 🙂
<center>
  <a href="https://github.com/nitin-787">
    <img src="https://avatars.githubusercontent.com/u/76255199?v=4" width=150px height=150px />
  </a>
  <br/>
  <a>
    <a href="https://github.com/nitin-787">
    <strong>
      Nitin Sharma
    </strong>
  </a>
</center>

# Contributors ❤️
Thank you!

<a href="https://github.com/nitin-787/myNotes/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=nitin-787/myNotes" />
</a>

<br/>

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)