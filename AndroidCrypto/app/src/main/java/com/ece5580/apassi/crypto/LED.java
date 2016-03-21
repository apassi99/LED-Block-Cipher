package com.ece5580.apassi.crypto;

/**
 * Created by apassi on 3/18/16.
 */
public class LED {

    static {
        System.loadLibrary("LED_Library");
    }

    public native String getMyString();

    public native byte [] encrypt(byte [] data, byte [] key);
}
