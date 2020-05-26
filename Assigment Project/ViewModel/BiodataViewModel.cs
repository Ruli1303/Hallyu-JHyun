using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class BiodataViewModel
    {
        public long Id { get; set; }
        public long NPM { get; set; }

        [Required]
        [StringLength(255)]
        public string FullName { get; set; }

        [Required]
        [StringLength(100)]
        public string Pob { get; set; }

        [Column(TypeName = "date")]
        public DateTime Dob { get; set; }

        public bool Gender { get; set; }

        [Required]
        [StringLength(50)]
        public string Religion { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        [StringLength(50)]
        public string Phone_number { get; set; }

        [Required]
        [StringLength(100)]
        public string Faculty { get; set; }

        [Required]
        [StringLength(100)]
        public string Major { get; set; }
    }
}
