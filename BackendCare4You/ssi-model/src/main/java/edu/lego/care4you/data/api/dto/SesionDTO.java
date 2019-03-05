package edu.lego.care4you.data.api.dto;

import javax.persistence.Column;
import java.util.Date;

public class SesionDTO {

    private Date dateAdmission;

    private Date dateDeparture;

    private boolean statusSesion;

    public Date getDateAdmission() {
        return dateAdmission;
    }

    public void setDateAdmission(Date dateAdmission) {
        this.dateAdmission = dateAdmission;
    }

    public Date getDateDeparture() {
        return dateDeparture;
    }

    public void setDateDeparture(Date dateDeparture) {
        this.dateDeparture = dateDeparture;
    }

    public boolean isStatusSesion() {
        return statusSesion;
    }

    public void setStatusSesion(boolean statusSesion) {
        this.statusSesion = statusSesion;
    }
}
