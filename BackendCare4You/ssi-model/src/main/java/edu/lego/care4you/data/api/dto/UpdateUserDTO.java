package edu.lego.care4you.data.api.dto;

import edu.lego.care4you.data.api.enums.StatusUser;
import edu.lego.care4you.data.domain.Sesion;

/**
 * @author: Ricardo Veizaga
 */
public class UpdateUserDTO {

    private String userName;

    private String password;

    private String suffix;

    private String emailPromotion;

    private String additionalInfo;

    private StatusUser status = StatusUser.ENABLED;

    private Sesion sesion;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
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

    public Sesion getSesion() {
        return sesion;
    }

    public void setSesion(Sesion sesion) {
        this.sesion = sesion;
    }
}
