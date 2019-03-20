package com.lego.care4you.demo.services.utils;

import org.springframework.util.StreamUtils;

import java.io.IOException;
import java.io.InputStream;

public class ImagenUtils {

    public static Byte[] inputStreamToByteArray(InputStream file) throws IOException {
        byte[] fileBytes = StreamUtils.copyToByteArray(file);
        Byte[] bytes = new Byte[fileBytes.length];
        int i = 0;
        for (Byte aByte : fileBytes) {
            bytes[i++] = aByte;
        }
        return bytes;
    }
}
