package edu.lego.care4you.data.api.dto;

import edu.lego.care4you.data.domain.Empresas;

import java.util.ArrayList;
import java.util.List;

public class NormasDTO {

    private String nombre;

    private String descripcion;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
