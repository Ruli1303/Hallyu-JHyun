namespace DataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class x_book
    {
        public long id { get; set; }

        public long created_by { get; set; }

        public DateTime created_on { get; set; }

        public long? modified_by { get; set; }

        public DateTime? modified_on { get; set; }

        public long? deleted_by { get; set; }

        public DateTime? deleted_on { get; set; }

        public bool is_delete { get; set; }

        public long category_id { get; set; }

        [StringLength(1000)]
        public string judul { get; set; }

        [StringLength(50)]
        public string penerbit { get; set; }

        [StringLength(50)]
        public string pengarang { get; set; }

        [StringLength(4)]
        public string tahun { get; set; }

        [StringLength(50)]
        public string lokasi_rak { get; set; }

        [StringLength(1000)]
        public string deskripsi { get; set; }
    }
}
