- [About Example App](#about_to_do_app)
    - [Requirement, feature list, Techs](#requirement)
    - [Screenshots and Video demo](#screenshoot-and-video-demo)
- [How to run this application?](#How-to-run-this-application?)
- [Local CI/CD With Fastlane](#local-cicd-with-fastlane)
- [How to run test cases?](#How-to-run-test-cases?)
- [Contact](#Contact)

# About Example App
Example App is a Flutter project with some informations below:
## Requirement vs feature list
- About Requirement - [Reference](https://docs.google.com/document/d/1n7EhCHG_V6QvPkBtRIAMoRP07m2JB7KQ/edit?usp=sharing&ouid=108569527156250137404&rtpof=true&sd=true)

- Feature list:

    * Current temperature and location name
    * The temperature forecast for the next 4 days (average temperature for each day should be shown for the forecast)

- Technicals:

    * Clean architecture with [flutter_bloc Package](https://pub.dev/packages/flutter_bloc)
    * Setup 3 environment for the app(dev, stg, pro)
    * Setup CI/CD with Firebase
    * Write the Unit tests

# How to run this application(on MacOS)?

1. Start a simulator(iOS or Android)
2. Open terminal and go to root project directory after that run command belove:

Run app with developer environment:
```yaml
flutter clean && flutter pub get && flutter run --flavor dev -t lib/main_dev.dart 
```
Note: Other environment(stg, pro) to build file(ipa or apk) for test on device.

# How to run test cases(on MacOS)?

- Open terminal and go to root project directory after that run command belove:

```yaml
flutter clean && flutter pub get && flutter test
```

# Local CI/CD With Fastlane

## Setup
- Install fastlane gem install fastlane or brew install fastlane. Visit the [fastlane docs](https://docs.fastlane.tools/) for more info.
- Run `bundle install` in your project's root dir
## Scripts

You can get detailed information on all the things you can do with these scripts in fastlane [iOS fastfile](ios/fastlane/Fastfile) and [Android fastfile](android/fastlane/Fastfile)

Remember to run all fastlane commands preceded by `bundle exec` (you can create an alias for this so it's easier).

For example: `bundle exec fastlane build_ipa` or `bundle exec fastlane androidlane`

## Configuration

To run scrip, you have to setup private `.env` files in [ios fastlane folder](ios/fastlane) and [android fastlane folder](android/fastlane). 

- Note: name of `.env` will follow format `.env.[name flavor]`. 

- Example: create `.env` file for flavor dev will be `.env.dev`

You can set up the following parameters in the env files:

### iOS
```
FLAVOR ='Flavor of your project'[pro, dev, stg]
SUFFIX = "Sufix of flavor" [pro, dev, stg] 
PROVISIONING_PROFILE_NAME = "Path of provisioning each flavor"
IOS_APP_ID = "App's Firebase App ID"
BUNDLE_IDENTIFIER = "Bundle identifire each flavor"
TESTER_GROUP_NAME = "Tester group name"
TG_BOT_TOKEN = "Telegram bot token"
TG_CHAT_ID = "Telegram chat id"

```

### Android
```
FLAVOR = 'Flavor of your project'[prod, dev, stg]
ANDROID_APP_ID = 'Android app's Firebase App ID'
TG_BOT_TOKEN = "Telegram bot token"
TG_CHAT_ID = "Telegram chat id"

```

## Actions
To build app for each flavor, you need param [flavor_name]:

- [flavor_name] = prod or dev or stg
### iOS

From the root project:
```
cd ios && fastlane ioslane --env [flavor_name]
```
Action will build ipa file, deploy to firebase and notify to telegram group about new release.

### Android

From the root project:
```
cd android && fastlane androidlane --env [flavor_name]
```
Action will build ipa file, deploy to firebase, and notify to telegram group about new release.

### Build ios and android 

From the root project:

```
cd android && fastlane androidlane --env [flavor_name] && cd .. && cd ios && fastlane ioslane --env [flavor_name] && cd ..

```
Cmd will build ipa file, apk file, deploy android app and ios app to firebase, notify to telegram group about new release.

# Contact

Nick Name: Sunny
My email: huynhthiminhnhuc@gmail.com

