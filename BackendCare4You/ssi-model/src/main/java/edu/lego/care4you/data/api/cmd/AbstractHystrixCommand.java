package edu.lego.care4you.data.api.cmd;

import edu.lego.care4you.data.api.exception.ExceptionConverter;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;


public abstract class AbstractHystrixCommand {

    public AbstractHystrixCommand() {
    }

    @HystrixCommand
    public void execute() {
        this.onExecute();
    }

    protected abstract void onExecute();

    protected abstract ExceptionConverter getExceptionConverter();
}
