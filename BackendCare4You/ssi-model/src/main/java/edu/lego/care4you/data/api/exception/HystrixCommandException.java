package edu.lego.care4you.data.api.exception;

import java.util.Map;

public class HystrixCommandException extends RuntimeException{
    private Map<String, Object> data;

    public HystrixCommandException(String message, Throwable cause, Map<String, Object> data) {
        super(message, cause);
        this.data = data;
    }

    public Map<String, Object> getData() {
        return this.data;
    }
}
