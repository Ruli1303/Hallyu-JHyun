namespace DataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class x_biodata
    {
        public long id { get; set; }

        public long created_by { get; set; }

        public DateTime created_on { get; set; }

        public long? modified_by { get; set; }

        public DateTime? modified_on { get; set; }

        public long? delete_by { get; set; }

        public DateTime? delete_on { get; set; }

        public bool is_delete { get; set; }

        public long identity_number { get; set; }

        [Required]
        [StringLength(255)]
        public string fullname { get; set; }

        [Required]
        [StringLength(100)]
        public string pob { get; set; }

        [Column(TypeName = "date")]
        public DateTime dob { get; set; }

        public bool gender { get; set; }

        [Required]
        [StringLength(50)]
        public string religion { get; set; }

        [StringLength(100)]
        public string email { get; set; }

        [StringLength(50)]
        public string phone_number1 { get; set; }

        [Required]
        [StringLength(100)]
        public string faculty { get; set; }

        [Required]
        [StringLength(100)]
        public string major { get; set; }
    }
}
