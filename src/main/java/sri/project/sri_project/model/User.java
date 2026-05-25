/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sri.project.sri_project.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import javax.annotation.processing.Generated;

/**
 *
 * @author Usuario
 *
 * */


@Getter
@Setter
@Entity
@Table(name = "usuarios")
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String username;
    private String passwordHash;
    private String rol;
    private String estado;


    public User() {
    }


    public User(Integer id, String username, String passwordHash, String rol, String estado) {
        this.id = id;
        this.username = username;
        this.passwordHash = passwordHash;
        this.rol = rol;
        this.estado = estado;
    }


    public boolean isActivo() {
        return "ACTIVO".equalsIgnoreCase(this.estado);
    }





}
