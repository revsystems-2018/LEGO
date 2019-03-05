package edu.lego.care4you.data.api.exception;

import org.springframework.http.HttpStatus;

import java.util.Map;

public class CommandExceptionConverter implements ExceptionConverter{

    @Override
    @SuppressWarnings("unchecked")
    public <T extends RuntimeException> T convert(HystrixCommandException source) {
        Map<String, Object> exceptionData = source.getData();

        Integer status = (Integer) exceptionData.get("status");
        if (null == status) {
            throw new UnsupportedOperationException("Unable to convert the Exception because 'status' is null", source);
        }

        if (HttpStatus.NOT_FOUND.value() == status) {
            return (T) new EntityNotFoundException();
        }

        throw new UnsupportedOperationException("Unhandled status value: " + status + ", unable to convert the Exception", source);
    }
}
