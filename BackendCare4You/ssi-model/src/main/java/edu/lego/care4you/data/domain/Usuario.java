package edu.lego.care4you.data.domain;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "Usuario")
public class Usuario extends DomainBase{

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
    private String status;

    @OneToMany(mappedBy = "sesion", fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
    private List<Sesion> sesions = new ArrayList<Sesion>();

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
