package edu.lego.care4you.data.api.cmd;

import edu.lego.care4you.data.api.exception.CommandExceptionConverter;
import edu.lego.care4you.data.api.exception.ExceptionConverter;

public abstract class AbstractCommand extends AbstractHystrixCommand {

    @Override
    protected ExceptionConverter getExceptionConverter() {
        return new CommandExceptionConverter();
    }
}
