package edu.lego.care4you.data.api.dto;

import edu.lego.care4you.data.domain.Normas;

public class CreateEmpresaDTO {

    private Integer NIT;

    private String nombre;

    private String vision;

    private String mision;

    private String direccion;

    private Integer telefono;

    private String correoElectronico;

    private Normas normas;

    public Integer getNIT() {
        return NIT;
    }

    public void setNIT(Integer NIT) {
        this.NIT = NIT;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getVision() {
        return vision;
    }

    public void setVision(String vision) {
        this.vision = vision;
    }

    public String getMision() {
        return mision;
    }

    public void setMision(String mision) {
        this.mision = mision;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }

    public String getCorreoElectronico() {
        return correoElectronico;
    }

    public void setCorreoElectronico(String correoElectronico) {
        this.correoElectronico = correoElectronico;
    }

    public Normas getNormas() {
        return normas;
    }

    public void setNormas(Normas normas) {
        this.normas = normas;
    }
}
