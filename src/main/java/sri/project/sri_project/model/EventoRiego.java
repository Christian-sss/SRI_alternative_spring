package sri.project.sri_project.model;


import jakarta.persistence.*;
import lombok.Data;
import sri.project.sri_project.model.enums.EstadoRiego;
import sri.project.sri_project.model.enums.ModoRiego;


import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "eventos_riego")
public class EventoRiego {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "cultivo_id", nullable = false)
    private Cultivo cultivo;


    @Enumerated(EnumType.STRING)
    @Column(name = "modo_riego",nullable = false)
    private ModoRiego modoRiego;

    @ManyToOne
    @JoinColumn(name = "usuario_id", nullable = true)
    private User usuario;

    @Column(name = "fecha_inicio", nullable = false)
    private LocalDateTime fechaInicio;

    @Column(name = "fecha_fin")
    private LocalDateTime fechaFin;

    @Column(name = "humedad_suelo_inicial", nullable = false)
    private Integer humedadSueloInicial;

    @Column(name = "humedad_suelo_final")
    private Integer humedadSueloFinal;

    @Enumerated(EnumType.STRING)
    @Column(name = "estado",nullable = false)
    private EstadoRiego estado;

}