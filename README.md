# react-native-geo-fencing

Native modules to determine if a location is within defined geographical boundaries using Google Geometry library [for ios](https://developers.google.com/maps/documentation/ios-sdk/reference/group___geometry_utils.html#ga8aad2b31a4a4197c919b8da82c84d180) and [android](http://googlemaps.github.io/android-maps-utils/javadoc/com/google/maps/android/PolyUtil.html#containsLocation-LatLng-java.util.List-boolean-).

### Usage
```js
import GeoFencing from 'react-native-geo-fencing';
```
```js
// with navigator geolocation
componentDidMount() {
  const polygon = [
    { lat: 3.1336599385978805, lng: 101.31866455078125 },
    { lat: 3.3091633559540123, lng: 101.66198730468757 },
    { lat: 3.091150714460597,  lng: 101.92977905273438 },
    { lat: 2.7222113428196213, lng: 101.74850463867188 },
    { lat: 2.7153526167685347, lng: 101.47933959960938 },
    { lat: 3.1336599385978805, lng: 101.31866455078125 } // last point has to be same as first point
  ];

  navigator.geolocation.getCurrentPosition(
    (position) => {
      let point = {
        lat: position.coords.latitude,
        lng: position.coords.longitude
      };

      GeoFencing.containsLocation(point, polygon)
        .then(() => console.log('point is within polygon'))
        .catch(() => console.log('point is NOT within polygon'))
    },
    (error) => alert(error.message),
    { enableHighAccuracy: true, timeout: 20000, maximumAge: 1000 }
  );
}
```

```js
// with only point and polygon
componentDidMount() {
  const polygon = [
    { lat: 3.1336599385978805, lng: 101.31866455078125 },
    { lat: 3.3091633559540123, lng: 101.66198730468757 },
    { lat: 3.091150714460597,  lng: 101.92977905273438 },
    { lat: 3.1336599385978805, lng: 101.31866455078125 } // last point has to be same as first point
  ];

  let point = {
    lat: 2.951269758090068,
    lng: 101.964111328125
  };

  GeoFencing.containsLocation(point, polygon)
    .then(() => console.log('point is within polygon'))
    .catch(() => console.log('point is NOT within polygon'))
}
```

### Installation
    $ npm install --save react-native-geo-fencing
#### ios
Within ```ios/``` directory of your react-native app:

1. Create a  ```Podfile``` manually or simply

    $ pod init

  ```ruby
  # Podfile for cocoapods 1.0
  platform :ios, '7.0'

  target 'yourAppTarget' do
    pod 'React', path: '../node_modules/react-native'
    pod 'react-native-geo-fencing', path: '../node_modules/react-native-geo-fencing'
  end
  ```

  ```ruby
  # for older version of CocoaPods
  platform :ios, '7.0'

  pod 'React', path: '../node_modules/react-native'
  pod 'react-native-geo-fencing', path: '../node_modules/react-native-geo-fencing'
  ```

2. Then

        $ pod install

3.  Add ```$(inherited)``` for ```Other Linker Flags``` to your project's ```build settings```
  ![linking_library](/screenshots/linker_flags.png)

4. Link the static library
  ![linking_binaries](/screenshots/link_binaries.png)


#### android
1. Add the following to ```android/settings.gradle```
  ```java
  include ':react-native-geo-fencing'
  project(':react-native-geo-fencing').projectDir = new File(settingsDir, '../node_modules/react-native-geo-fencing/android')
  ```

2. Add the following to ```android/app/build.gradle```
  ```java
  dependencies {
    // ...
    compile project(':react-native-geo-fencing')
  }
  ```

3. Edit ```android/src/.../MainActivity.java```
  ```java
  // ...
  import com.surialabs.rn.geofencing.GeoFencingPackage;// <--

  public class MainActivity extends ReactActivity {
      @Override
      protected List<ReactPackage> getPackages() {
          return Arrays.<ReactPackage>asList(
              new MainReactPackage(),
              new GeoFencingPackage() // <--
          );
      }
  }
  ```
4. Enable access to location when using the app from your ```AndroidManifest.xml```

    ```<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />```
