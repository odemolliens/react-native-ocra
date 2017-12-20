import React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import ODOcra from 'react-native-ocra';
export default class App extends React.Component {

  constructor() {
    super();
    ODOcra.generateOcra(
	"OCRA-1:HOTP-SHA1-6:QN08",
	"shared_key",
	null,
	"MyQuestion",
	"MyPassword",
	"sessionInformation",
	null
  ).then(ocraValue => console.warn(ocraValue));
  }

  render() {
    return (
      <View style={styles.container}>
        <Text>Open up App.js to start working on your app!</Text>
        <Text>Changes you make will automatically reload.</Text>
        <Text>Shake your phone to open the developer menu.</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
