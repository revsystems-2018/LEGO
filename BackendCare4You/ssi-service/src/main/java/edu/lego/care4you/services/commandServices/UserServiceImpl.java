package edu.lego.care4you.services.commandServices;

import edu.lego.care4you.data.api.cmd.LoadUsersByEmailCMD;
import edu.lego.care4you.data.domain.User;
import edu.lego.care4you.hystrix.HystrixCommandFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl {

    @Autowired
    private HystrixCommandFactory commandFactory;

    public List<User> findByEmail(String emailUser){
        LoadUsersByEmailCMD command = (LoadUsersByEmailCMD) commandFactory.createInstance(LoadUsersByEmailCMD.class);
        command.setEmailUser(emailUser);
        command.execute();

        return command.getUsers();
    }
}
