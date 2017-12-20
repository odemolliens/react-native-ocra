
package com.odemolliens.rn.ocra;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.nio.ByteBuffer;

public class ODOcraModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public ODOcraModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "ODOcra";
    }


    @ReactMethod
    public void generateOcra(String ocraSuite, String key, String counter, String question, String password, String sessionInformation, String timeStamp, Promise promise) {
        String ocra = generateOCRA(ocraSuite, key, counter, question, password, sessionInformation, timeStamp);

        if (ocra == null) {
            promise.reject(new Throwable("Ocra token is null"));
        } else {
            promise.resolve(ocra);
        }
    }

    private static String generateOCRA(String ocraSuite, String key, String counter, String question, String password, String sessionInformation, String timeStamp) {
        if (counter.equals("")) {
            counter = null;
        }

        if (password.equals("")) {
            password = null;
        }

        if (sessionInformation.equals("")) {
            sessionInformation = null;
        }

        if (timeStamp.equals("")) {
            timeStamp = getTimeReference(System.currentTimeMillis());
        } else {
            long timeStampLong = Long.parseLong(timeStamp);
            timeStamp = getTimeReference(timeStampLong);
        }

        return OCRA.generateOCRA(ocraSuite, ODOcraModule.byteArrayToHex(key.getBytes()), counter, question, password, sessionInformation, timeStamp);
    }

    public static String getTimeReference(long currentTime) {
        long roundingFactor = 1000 * 60 * 5; // The rounding factor is 5 minutes
        return ODOcraModule.byteArrayToHex(convertLongToByteArray(currentTime /
                roundingFactor));
    }

    private static byte[] convertLongToByteArray(final Long longValue) {
        int byteArraySize = Long.SIZE / Byte.SIZE; // 64 bits / 8 bits = 8 bytes
        return ByteBuffer.allocate(byteArraySize).putLong(longValue).array();
    }

    private static String byteArrayToHex(byte[] a) {
        StringBuilder sb = new StringBuilder(a.length * 2);
        for(byte b: a)
           sb.append(String.format("%02x", b));
        return sb.toString();
     }

}