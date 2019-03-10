package edu.lego.care4you.services;

import edu.lego.care4you.data.domain.User;
import edu.lego.care4you.services.commandServices.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Service
public class UserService {

    @Autowired
    private UserServiceImpl userServiceImpl;

    public Map<String, User> loadAllUsersMap(String emailUser) {
        List<User> users = userServiceImpl.findByEmail(emailUser);

        if (users.isEmpty()) {
            return new HashMap<>();
        }

        return users.stream().collect(Collectors.toMap(User::getEmailPromotion, Function.<User>identity()));
    }
}
