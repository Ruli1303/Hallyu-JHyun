using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class CategoryViewModel
    {
        public long Id { get; set; }

        [Required]
        [StringLength(10)]
        public string Initial { get; set; }

        [Required(ErrorMessage = "Nama tidak boleh kosong")]
        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(100)]
        public string Description { get; set; }
    }
}
