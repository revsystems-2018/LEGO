package edu.lego.care4you.data.api.cmd;

import edu.lego.care4you.data.api.dto.CreateUsuarioDTO;
import edu.lego.care4you.data.api.repository.UserRepository;
import edu.lego.care4you.data.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CreateUserCMD extends AbstractCommand {

    private CreateUsuarioDTO createUsuario;

    private User user;

    @Autowired
    private UserRepository userRepository;

    @Override
    protected void onExecute() {
        if (null == createUsuario) {
        }
        user = userRepository.save(user.buildUsuario(createUsuario));
    }

    public void setCreateUsuario(CreateUsuarioDTO createUsuario) {
        this.createUsuario = createUsuario;
    }

    public User getUser() {
        return user;
    }
}
