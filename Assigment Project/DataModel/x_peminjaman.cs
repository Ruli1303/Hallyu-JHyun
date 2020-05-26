namespace DataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class x_peminjaman
    {
        public long id { get; set; }

        public long created_by { get; set; }

        public DateTime created_on { get; set; }

        public long? modified_by { get; set; }

        public DateTime? modified_on { get; set; }

        public long? deleted_by { get; set; }

        public DateTime? deleted_on { get; set; }

        public bool is_delete { get; set; }

        public long biodata_id { get; set; }

        [StringLength(100)]
        public string pegawai { get; set; }

        public long book_id { get; set; }

        public DateTime tanggal_pinjam { get; set; }

        public DateTime tanggal_kembali { get; set; }

        [Required]
        [StringLength(20)]
        public string status { get; set; }

        public DateTime? tanggal_dikembalikan { get; set; }
    }
}
