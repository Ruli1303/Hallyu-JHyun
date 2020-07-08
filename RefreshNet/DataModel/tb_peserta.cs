namespace DataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class tb_peserta
    {
        public long Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Nama { get; set; }

        [Required]
        [StringLength(13)]
        public string No_hp { get; set; }

        [StringLength(30)]
        public string Email { get; set; }

        public DateTime Tanggal_lahir { get; set; }

        [Required]
        [StringLength(100)]
        public string Alamat { get; set; }

        [Required]
        [StringLength(10)]
        public string Jurusan { get; set; }

        [StringLength(1000)]
        public string Pertanyaan { get; set; }

        [Required]
        [StringLength(10)]
        public string Create_by { get; set; }

        public DateTime Create_on { get; set; }

        [StringLength(10)]
        public string Modified_by { get; set; }

        public DateTime? Modified_on { get; set; }

        [StringLength(10)]
        public string Delete_by { get; set; }

        public DateTime? Delete_on { get; set; }

        public bool Is_delete { get; set; }
    }
}
