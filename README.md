# Flutter location_provider Plugin

[![pub package](https://img.shields.io/pub/v/geocoding.svg)](https://pub.dartlang.org/packages/geocoding)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)

A Flutter location_provider plugin which provides easy address and latlong and reverse-geocoding features.

**Important**:

1. This plugin uses the free Geocoding services provided by the iOS and Android platforms. This means that there are restrictions to their use. More information can be found in the [Apple documentation for iOS](https://developer.apple.com/documentation/corelocation/clgeocoder) and the [Google documentation for Android](https://developer.android.com/reference/android/location/Geocoder).
   When a `PlatformException(IO_ERROR, ...)` gets thrown, most of the times it means that the rate limit has been reached.
2. The availability of the Google Play Services depends on your country. If your country doesn't support a connection with the Google Play Services, you'll need to try a VPN to establish a connection. For more information about how to work with Google Play Services visit the following link: https://developers.google.com/android/guides/overview

## Usage

To use this plugin, please follow the installation guide on the [official geocoding plugin page](https://pub.dev/packages/geocoding/install).

> **NOTE:** This plugin relies on the AndroidX version of the Android Support Libraries. This means you need to make sure your Android project is also upgraded to support AndroidX. Detailed instructions can be found [here](https://flutter.dev/docs/development/packages-and-plugins/androidx-compatibility).
>
>The TL;DR version is:
>
>1. Add the following to your "gradle.properties" file:
>
>```
>android.useAndroidX=true
>android.enableJetifier=true
>```
>2. Make sure you set the `compileSdkVersion` in your "android/app/build.gradle" file to 31:
>
>```
>android {
>  compileSdkVersion 31
>
>  ...
>}
>```
>3. Make sure you replace all the `android.` dependencies to their AndroidX counterparts (a full list can be found [Android migration guide](https://developer.android.com/jetpack/androidx/migrate)).

## API

To translate an address into latitude and longitude coordinates you can use the `placemarkFromAddress` method:

``` dart
import 'package:location_provider/location_provider.dart';
final lat = await LocationHelper.getLatitudeFromAddress(address);
final lng = await LocationHelper.getLongitudeFromAddress(address);
```

If you want to translate latitude and longitude coordinates into an address you can use the `placemarkFromCoordinates` method:

``` dart
import 'package:location_provider/location_provider.dart';

final address = await LocationHelper.getLocationFullAddress(lat, lan);
```


## Issues

Please file any issues, bugs or feature requests as an issue, you can contact us at <rahulkushwaha482@gmail.com>.

## Author

This geocoding plugin for Flutter is developed by [RahulKushwaha](https://in.linkedin.com/in/rahulkushwaha482).
