
# react-native-ocra

## Getting started

`$ npm install react-native-ocra --save`

### Mostly automatic installation

`$ react-native link react-native-ocra`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-ocra` and add `ODOcra.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libODOcra.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.odemolliens.rn.ocra.ODOcraPackage;` to the imports at the top of the file
  - Add `new ODOcraPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-ocra'
  	project(':react-native-ocra').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-ocra/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-ocra')
  	```


## Usage

```javascript
import ODOcra from 'react-native-ocra';

// For omitted optional values pass empty strings
ODOcra.generateOcra(
	ocraSuite, // String, ocra suite for example "OCRA-1:HOTP-SHA1-6:QN08"
	key,  // String, the shared secret
	counter, // String (optional), the counter that changes on a per use basis, HEX encoded
	question, // String the challenge question, HEX encoded
	password, // String (optional), a password that can be used, HEX encoded
	sessionInformation, // String (optional), Static information that identifies the current session, HEX encoded
	timeStamp // String (optional), current timestamp since Unix Epoch in milliseconds converted to string, if not provided the library uses the current time
	).then(ocraValue => console.log(ocraValue));
```
  
ReactContextBaseJavaModule