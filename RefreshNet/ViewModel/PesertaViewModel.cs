using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class PesertaViewModel
    {
        public long id { get; set; }

        [Required(ErrorMessage ="Nama tidak boleh kosong")]
        [StringLength(50)]
        public string nama { get; set; }

        [DataType(DataType.PhoneNumber)]
        [RegularExpression(@"^(\d{13})$", ErrorMessage = "Hanya berisi angka")]
        [Required(ErrorMessage = "No Telpon tidak boleh kosong")]
        [StringLength(13)]
        public string noTelpon { get; set; }

        [EmailAddress(ErrorMessage ="Format Email salah, tidak terdapat @.")]
        [StringLength(30)]
        public string email { get; set; }

        public DateTime tanggalLahir { get; set; }

        [Required(ErrorMessage ="Alamat tidak boleh kosong")]
        [StringLength(100)]
        public string alamat { get; set; }

        [Required(ErrorMessage ="Jurusan belum dipilh")]
        [StringLength(10)]
        public string jurusan { get; set; }

        [StringLength(1000)]
        public string pertanyaan { get; set; }
    }
}
