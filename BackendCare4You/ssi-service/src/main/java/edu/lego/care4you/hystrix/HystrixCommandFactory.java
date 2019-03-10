package edu.lego.care4you.hystrix;

import edu.lego.care4you.data.api.cmd.AbstractHystrixCommand;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class HystrixCommandFactory implements ApplicationContextAware {

    private static ApplicationContext context = null;

    public HystrixCommandFactory() {
    }

    public <CMD extends AbstractHystrixCommand> AbstractHystrixCommand createInstance(Class<CMD> clazz) {
        return (AbstractHystrixCommand) context.getBean(clazz);
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {

    }
}
