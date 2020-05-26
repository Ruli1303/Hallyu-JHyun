namespace DataModel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class XContext : DbContext
    {
        public XContext()
            : base("name=XContext")
        {
        }

        public virtual DbSet<x_biodata> x_biodata { get; set; }
        public virtual DbSet<x_book> x_book { get; set; }
        public virtual DbSet<x_category> x_category { get; set; }
        public virtual DbSet<x_peminjaman> x_peminjaman { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<x_biodata>()
                .Property(e => e.fullname)
                .IsUnicode(false);

            modelBuilder.Entity<x_biodata>()
                .Property(e => e.pob)
                .IsUnicode(false);

            modelBuilder.Entity<x_biodata>()
                .Property(e => e.religion)
                .IsUnicode(false);

            modelBuilder.Entity<x_biodata>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<x_biodata>()
                .Property(e => e.phone_number1)
                .IsUnicode(false);

            modelBuilder.Entity<x_biodata>()
                .Property(e => e.faculty)
                .IsUnicode(false);

            modelBuilder.Entity<x_biodata>()
                .Property(e => e.major)
                .IsUnicode(false);

            modelBuilder.Entity<x_book>()
                .Property(e => e.judul)
                .IsUnicode(false);

            modelBuilder.Entity<x_book>()
                .Property(e => e.penerbit)
                .IsUnicode(false);

            modelBuilder.Entity<x_book>()
                .Property(e => e.pengarang)
                .IsUnicode(false);

            modelBuilder.Entity<x_book>()
                .Property(e => e.tahun)
                .IsUnicode(false);

            modelBuilder.Entity<x_book>()
                .Property(e => e.lokasi_rak)
                .IsUnicode(false);

            modelBuilder.Entity<x_book>()
                .Property(e => e.deskripsi)
                .IsUnicode(false);

            modelBuilder.Entity<x_category>()
                .Property(e => e.initial)
                .IsUnicode(false);

            modelBuilder.Entity<x_category>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<x_category>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<x_peminjaman>()
                .Property(e => e.pegawai)
                .IsUnicode(false);

            modelBuilder.Entity<x_peminjaman>()
                .Property(e => e.status)
                .IsUnicode(false);
        }
    }
}
