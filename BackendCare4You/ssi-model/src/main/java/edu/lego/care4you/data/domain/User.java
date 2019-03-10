package edu.lego.care4you.data.domain;

import edu.lego.care4you.data.api.dto.CreateUsuarioDTO;
import edu.lego.care4you.data.api.enums.StatusUser;

import javax.persistence.*;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "User")
public class User extends DomainBase {

    @Column(name = "NombreUsuario")
    private String userName;

    @Column(name = "password")
    private byte[] password;

    @Column(name = "sufijo")
    private String suffix;

    @Column(name = "correoElectronico")
    private String emailPromotion;

    @Column(name = "infoAdicional")
    private String additionalInfo;

    @Column(name = "estado")
    private StatusUser status = StatusUser.ENABLED;

    @OneToOne(optional = true)
    private Sesion sesion;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public byte[] getPassword() {
        return password;
    }

    public void setPassword(byte[] password) {
        this.password = password;
    }

    public String getSuffix() {
        return suffix;
    }

    public void setSuffix(String suffix) {
        this.suffix = suffix;
    }

    public String getEmailPromotion() {
        return emailPromotion;
    }

    public void setEmailPromotion(String emailPromotion) {
        this.emailPromotion = emailPromotion;
    }

    public String getAdditionalInfo() {
        return additionalInfo;
    }

    public void setAdditionalInfo(String additionalInfo) {
        this.additionalInfo = additionalInfo;
    }

    public StatusUser getStatus() {
        return status;
    }

    public void setStatus(StatusUser status) {
        this.status = status;
    }

    public User buildUsuario(CreateUsuarioDTO usuarioDTO) {
        return new User();
    }
}
