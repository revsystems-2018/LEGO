package edu.lego.care4you.data.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

/**
 * @author: Ricardo Veizaga
 */
@Entity
@Table(name = "Sesion")
public class Sesion extends DomainBase{

    @Column(name = "fechaAdmision")
    private Date dateAdmission;

    @Column(name = "fechaSalida")
    private Date dateDeparture;

    @Column(name = "estadoSesion")
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
