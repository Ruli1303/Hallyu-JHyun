using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ViewModel
{
    public class PeminjamanViewModel
    {
        public long Id { get; set; }
        public long BiodataId { get; set; }

        public long NPM { get; set; }

        [StringLength(100)]
        public string FullName { get; set; }

        public long CategoryId { get; set; }
        public string Name { get; set; }

        public long BookId { get; set; }

        public string Judul { get; set; }

        [StringLength(100)]
        public string Pegawai { get; set; }

        //[Column(TypeName = "date")]
        //[DataType(DataType.Date)]
        //[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = true)]
        //[DisplayFormat(DataFormatString = "{0:MMMM d, yyyy}", ApplyFormatInEditMode = true)]
        public DateTime TanggalPinjam { get; set; }

        public DateTime TanggalKembali { get; set; }

        public string Status { get; set; }

        public DateTime TanggalPengembalian { get; set; }

        public string Penulis { get; set; }
        public string Penerbit { get; set; }

    }
}
