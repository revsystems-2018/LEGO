package edu.lego.care4you.data.api.dto;

import edu.lego.care4you.data.api.enums.StatusUser;

/**
 * @author: Ricardo Veizaga
 */
public class CreateUsuarioDTO {

    private String name;

    private String userName;

    private String password;

    private String emailPromotion;

    private StatusUser status;

    private Long sesionId;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

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

    public String getEmailPromotion() {
        return emailPromotion;
    }

    public void setEmailPromotion(String emailPromotion) {
        this.emailPromotion = emailPromotion;
    }

    public StatusUser getStatus() {
        return status;
    }

    public void setStatus(StatusUser status) {
        this.status = status;
    }

    public Long getSesionId() {
        return sesionId;
    }

    public void setSesionId(Long sesionId) {
        this.sesionId = sesionId;
    }
}
