namespace DataModel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class XposContext : DbContext
    {
        public XposContext()
            : base("name=XposContext")
        {
        }

        public virtual DbSet<tb_peserta> tb_peserta { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Nama)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.No_hp)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Alamat)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Jurusan)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Pertanyaan)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Create_by)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Modified_by)
                .IsUnicode(false);

            modelBuilder.Entity<tb_peserta>()
                .Property(e => e.Delete_by)
                .IsUnicode(false);
        }
    }
}
