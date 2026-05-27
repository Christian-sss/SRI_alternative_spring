package sri.project.sri_project.model;


import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "perfiles_cultivo")
public class Cultivo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false, length = 50)
    private String nombre;

    @Column(name = "humedad_min_optima", nullable = false)
    private Integer humedadMinOptima;

    @Column(name = "humedad_max_optima", nullable = false)
    private Integer humedadMaxOptima;

    @Column(name = "trato_recomendado", columnDefinition = "TEXT")
    private String tratoRecomendado;

    @Column(name = "fecha_registro", insertable = false, updatable = false)
    private LocalDateTime fechaRegistro;

}