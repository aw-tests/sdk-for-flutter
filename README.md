# Appwrite Flutter SDK

[![pub package](https://img.shields.io/pub/v/appwrite?style=flat-square.svg)](https://pub.dartlang.org/packages/appwrite)
![License](https://img.shields.io/github/license/appwrite/sdk-for-flutter.svg?style=flat-square)
![Version](https://img.shields.io/badge/api%20version-0.8.0-blue.svg?style=flat-square)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite_io?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite_io)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)

**This SDK is compatible with Appwrite server version 0.8.x. For older versions, please check [previous releases](https://github.com/appwrite/sdk-for-flutter/releases).**

Appwrite is an open-source backend as a service server that abstract and simplify complex and repetitive development tasks behind a very simple to use REST API. Appwrite aims to help you develop your apps faster and in a more secure way.
                        Use the Flutter SDK to integrate your app with the Appwrite server to easily start interacting with all of Appwrite backend APIs and tools.
                        For full API documentation and tutorials go to [https://appwrite.io/docs](https://appwrite.io/docs)



![Appwrite](https://appwrite.io/images/github.png)

## Installation

Add this to your package's `pubspec.yaml` file:

```yml
dependencies:
  appwrite: ^0.6.0
```

You can install packages from the command line:

```bash
pub get appwrite
```


## Getting Started

### Add your Flutter Platform
To init your SDK and start interacting with Appwrite services, you need to add a new Flutter platform to your project. To add a new platform, go to your Appwrite console, choose the project you created in the step before, and click the 'Add Platform' button.

From the options, choose to add a new **Flutter** platform and add your app credentials. Appwrite Flutter SDK currently supports building apps for both iOS and Android.

If you are building your Flutter application for multiple devices, you have to follow this process for each different device.

#### iOS
For **iOS** add your app name and Bundle ID, You can find your Bundle Identifier in the General tab for your app's primary target in Xcode.

#### Android
For **Android** add your app <u>name</u> and <u>package name</u>, Your package name is generally the applicationId in your app-level build.gradle file. By registering your new app platform, you are allowing your app to communicate with the Appwrite API.

### iOS

The Appwrite SDK uses ASWebAuthenticationSession on iOS 12+ and SFAuthenticationSession on iOS 11 to allow OAuth authentication. You have to change your iOS Deployment Target in Xcode to be iOS >= 11 to be able to build your app on an emulator or a real device.

1. In Xcode, open Runner.xcworkspace in your app's ios folder.
2. To view your app's settings, select the Runner project in the Xcode project navigator. Then, in the main view sidebar, select the Runner target.
3. Select the General tab.
4. In Deployment Info, 'Target' select iOS 11.0

### Android
In order to capture the Appwrite OAuth callback url, the following activity needs to be added to your [AndroidManifest.xml](https://github.com/appwrite/playground-for-flutter/blob/master/android/app/src/main/AndroidManifest.xml). Be sure to relpace the **[PROJECT_ID]** string with your actual Appwrite project ID. You can find your Appwrite project ID in you project settings screen in your Appwrite console.

```xml
<manifest>
    <application>
        <activity android:name="com.linusu.flutter_web_auth.CallbackActivity" >
            <intent-filter android:label="flutter_web_auth">
                <action android:name="android.intent.action.VIEW" />
                <category android:name="android.intent.category.DEFAULT" />
                <category android:name="android.intent.category.BROWSABLE" />
                <data android:scheme="appwrite-callback-[PROJECT_ID]" />
            </intent-filter>
        </activity>
    </application>
</manifest>
```

### Web
Appwrite 0.7, and the Appwrite Flutter SDK 0.3.0 have added support for Flutter Web. To build web apps that integrate with Appwrite successfully, all you have to do is add a web platform on your Appwrite project's dashboard and list the domain your website will use to allow communication to the Appwrite API.

#### Flutter Web Cross-Domain Communication & Cookies
While running Flutter Web, make sure your Appwrite server and your Flutter client are using the same top-level domain and the same protocol (HTTP or HTTPS) to communicate. When trying to communicate between different domains or protocols, you may receive HTTP status error 401 because some modern browsers block cross-site or insecure cookies for enhanced privacy. In production, Appwrite allows you set multiple [custom-domains](https://appwrite.io/docs/custom-domains) for each project.

### Init your SDK

<p>Initialize your SDK code with your project ID, which can be found in your project settings page.

```dart
import 'package:appwrite/appwrite.dart';
Client client = Client();


client
  .setEndpoint('https://localhost/v1') // Your Appwrite Endpoint
  .setProject('5e8cf4f46b5e8') // Your project ID
  .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
;
```

Before starting to send any API calls to your new Appwrite instance, make sure your Android or iOS emulators has network access to the Appwrite server hostname or IP address.

When trying to connect to Appwrite from an emulator or a mobile device, localhost is the hostname for the device or emulator and not your local Appwrite instance. You should replace localhost with your private IP as the Appwrite endpoint's hostname. You can also use a service like [ngrok](https://ngrok.com/) to proxy the Appwrite API.

### Make Your First Request

<p>Once your SDK object is set, access any of the Appwrite services and choose any request to send. Full documentation for any service method you would like to use can be found in your SDK documentation or in the API References section.

```dart
// Register User
Account account = Account(client);
Response user = await account
  .create(
    email: 'me@appwrite.io',
    password: 'password',
    name: 'My Name'
  );
```

### Full Example

```dart
import 'package:appwrite/appwrite.dart';
Client client = Client();


client
  .setEndpoint('https://localhost/v1') // Your Appwrite Endpoint
  .setProject('5e8cf4f46b5e8') // Your project ID
  .setSelfSigned() // Use only on dev mode with a self-signed SSL cert
  ;


// Register User
Account account = Account(client);

Response user = await account
  .create(
    email: 'me@appwrite.io',
    password: 'password',
    name: 'My Name'
  );
```

### Error Handling
The Appwrite Flutter SDK raises `AppwriteException` object with `message`, `code` and `response` properties. You can handle any errors by catching `AppwriteException` and present the `message` to the user or handle it yourself based on the provided error information. Below is an example.

```dart
Users users = Users(client);

try {
  final response = await users.create(email: ‘email@example.com’,password: ‘password’, name: ‘name’);
  print(response.data);
} on AppwriteException catch(e) {
  //show message to user or do other operation based on error as required
  print(e.message);
}
```

### Learn more
You can use followng resources to learn more and get help
- 🚀 [Getting Started Tutorial](https://appwrite.io/docs/getting-started-for-flutter)
- 📜 [Appwrite Docs](https://appwrite.io/docs)
- 💬 [Discord Community](https://appwrite.io/discord)
- 🚂 [Appwrite Flutter Playground](https://github.com/appwrite/playground-for-flutter)

## Contribution

This library is auto-generated by Appwrite custom [SDK Generator](https://github.com/appwrite/sdk-generator). To learn more about how you can help us improve this SDK, please check the [contribution guide](https://github.com/appwrite/sdk-generator/blob/master/CONTRIBUTING.md) before sending a pull-request.

## License

Please see the [BSD-3-Clause license](https://raw.githubusercontent.com/appwrite/appwrite/master/LICENSE) file for more information.