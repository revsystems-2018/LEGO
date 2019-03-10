package edu.lego.care4you.data.api.cmd;

import edu.lego.care4you.data.api.repository.UserRepository;
import edu.lego.care4you.data.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class LoadUsersByEmailCMD extends AbstractCommand {

    private String emailUser;

    private List<User> users;

    @Autowired
    private UserRepository userRepository;

    @Override
    protected void onExecute() {
        if (null == emailUser) {
        }
        userRepository.findByEmailPromotion(emailUser);
    }

    public void setEmailUser(String emailUser) {
        this.emailUser = emailUser;
    }

    public List<User> getUsers() {
        return users;
    }
}
