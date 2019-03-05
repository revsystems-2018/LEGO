package edu.lego.care4you.data.api.cmd;

import edu.lego.care4you.data.api.dto.CreateUsuarioDTO;
import edu.lego.care4you.data.api.repository.UsuarioRepository;
import edu.lego.care4you.data.domain.Usuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CreateUserCMD extends AbstractCommand {

    private CreateUsuarioDTO createUsuario;

    private Usuario usuario;

    @Autowired
    private UsuarioRepository usuarioRepository;

    @Override
    protected void onExecute() {
        if (null == createUsuario) {
        }
        usuario = usuarioRepository.save(usuario.buildUsuario(createUsuario));
    }

    public void setCreateUsuario(CreateUsuarioDTO createUsuario) {
        this.createUsuario = createUsuario;
    }

    public Usuario getUsuario() {
        return usuario;
    }
}
