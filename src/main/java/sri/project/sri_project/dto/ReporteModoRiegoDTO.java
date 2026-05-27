package sri.project.sri_project.dto;

import sri.project.sri_project.model.enums.ModoRiego;

public record ReporteModoRiegoDTO(
        ModoRiego modoRiego,
        Long cantidad
) {}
