package edu.lego.care4you.data.api.exception;

public interface ExceptionConverter {
    <T extends RuntimeException> T convert(HystrixCommandException var1);
}
