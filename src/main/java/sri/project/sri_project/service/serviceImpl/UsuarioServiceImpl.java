/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sri.project.sri_project.service.serviceImpl;


import sri.project.sri_project.service.UsuarioService;
import sri.project.sri_project.repository.UsuarioRepository;
import sri.project.sri_project.model.User;
import org.springframework.stereotype.Service;

import java.util.Optional;

/**
 * @author Usuario
 */

@Service
public class UsuarioServiceImpl implements UsuarioService {

    private final UsuarioRepository usuarioRepository;


    public UsuarioServiceImpl(UsuarioRepository userRepository) {
        this.usuarioRepository = userRepository;
    }


    @Override
    public User ejecutar(String email, String passwordHash) {

        var user = usuarioRepository
                .findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException(""));

        try {

            if (!passwordHash.equals(user.getPasswordHash())) {
                throw new Exception("Contraseña incorrecta.");
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }


        return user;

    }


}
