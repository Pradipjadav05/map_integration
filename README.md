# google_map_integration

# create project on Google Cloud Platform 
- https://console.developers.google.com/
- Enabling the Maps API
- Click the Library menu on the left
  Search for “Maps SDK”
  Click Maps SDK for iOS and then click Enable
  Click Maps SDK for Android and then click Enable

# Generating and restricting API keys
- Click on the Credentials menu on the left
  Click the + CREATE CREDENTIALS button
  Select the API key option

# Adding Google Maps in Flutter app (Android)
- android/app/src/main/AndroidManifest.xml
```dart
<application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
```
Now the AndroidManifest.xml file should look like this:

```dart

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.pinkesh.google_maps_flutter">

    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />

    <application
        android:label="google_maps_flutter"
        android:icon="@mipmap/ic_launcher">

       <!-- TODO: Add your API key here -->
       <meta-data android:name="com.google.android.geo.API_KEY"
           android:value="YOUR KEY HERE"/>

        <activity>...</activity>
    </application>
</manifest>

```

# Adding Google Maps in Flutter (iOS)
- ios/Runner/AppDelegate.swift

```dart
import UIKit
import Flutter
import GoogleMaps
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
override func application(
_ application: UIApplication,
didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
) -> Bool {
GeneratedPluginRegistrant.register(with: self)
GMSServices.provideAPIKey("YOUR-KEY")
return super.application(application, didFinishLaunchingWithOptions: launchOptions)
}
}
```

- Next, open the Xcode and add the location permission in the info.plist file:
```dart
<key>NSLocationWhenInUseUsageDescription</key>
<string>The app needs location permission</string>
```


# add package:
- google_maps_flutter

## for creating json file of map style
- https://mapstyle.withgoogle.com/
  - steps:
  1. Go to this website 
  2. Select the silver theme 
  3. Click to adjust Landmark and Labels 
  4. Restore Park colors 
  5. Click Finish 
  6. Click the COPY JSON button


## Reference:
https://blog.logrocket.com/google-maps-flutter/