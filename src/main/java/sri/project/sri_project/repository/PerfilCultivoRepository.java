package sri.project.sri_project.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import sri.project.sri_project.model.Cultivo;

@Repository
public interface PerfilCultivoRepository extends JpaRepository<Cultivo,Integer> {

}
