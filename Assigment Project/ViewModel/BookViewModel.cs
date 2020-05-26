using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class BookViewModel
    {
        public long Id { get; set; }
        public long CategoryId { get; set; }

        public string CategoryName { get; set; }

        [Required(ErrorMessage = "Judul buku tidak boleh kosong")]
        public string Judul { get; set; }

        [StringLength(50)]
        public string Penerbit { get; set; }

        [StringLength(50)]
        public string Pengarang { get; set; }

        [StringLength(4)]
        public string Tahun { get; set; }

        [StringLength(50)]
        public string LokasiRak { get; set; }

        [StringLength(1000)]
        public string Deskripsi { get; set; }
    }
}
