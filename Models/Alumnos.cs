using System.ComponentModel.DataAnnotations;

namespace WebApplication2
{
    public class AlumnosCE
    {
        public int id { get; set; }
        [Required]
        [Display(Name = "Inserte nombre")]
        public string nombre { get; set; }
        [Required]
        public string apellido1 { get; set; }
        [Required]
        [MinLength(1)]
        [MaxLength(3)]
        public string edad { get; set; }
        public System.DateTime fecha_registro { get; set; }
    }

    // Si no indicamos aquí metadatatype no funcionarán las validaciones.
    [MetadataType(typeof(AlumnosCE))]
    public partial class Alumnos
    {
        public int Estado { get; set; }
        public string NombreCompleto { get { return nombre + " " + apellido1;  } }
    }
}