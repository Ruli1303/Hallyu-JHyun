using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViewModel;

namespace DataAccess
{
    public class PeminjamanRepo
    {
        public static List<PeminjamanViewModel> All()
        {
            List<PeminjamanViewModel> result = new List<PeminjamanViewModel>();
            using (var db = new XContext())
            {
                result = (from c in db.x_peminjaman
                          join d in db.x_book on c.book_id equals d.id
                          join e in db.x_biodata on c.biodata_id equals e.id
                          where c.is_delete == false
                          select new PeminjamanViewModel
                          {
                              Id = c.id,
                              BiodataId = c.biodata_id,
                              NPM = e.identity_number,
                              FullName = e.fullname,
                              BookId = c.biodata_id,
                              Judul = d.judul,
                              Pegawai = c.pegawai,
                              TanggalPinjam = c.tanggal_pinjam,
                              TanggalKembali = c.tanggal_kembali,
                              Status = c.status
                          }).ToList();
            }
            return result;
        }

        public static PeminjamanViewModel ById(int id)
        {
            //Id Variant.Id
            PeminjamanViewModel result = new PeminjamanViewModel();
            using (var db = new XContext())
            {
                result = (from c in db.x_peminjaman
                          join d in db.x_book on c.book_id equals d.id into booklf
                          from d in booklf.DefaultIfEmpty()
                          join e in db.x_category on d.category_id equals e.Id into catlf
                          from e in catlf.DefaultIfEmpty()
                          join f in db.x_biodata on c.biodata_id equals f.id into biolf
                          from f in biolf.DefaultIfEmpty()
                          where c.id == id && c.is_delete == false
                          select new PeminjamanViewModel
                          {
                              Id = c.id,
                              BiodataId = c.biodata_id,
                              NPM = f.identity_number,
                              FullName = f.fullname,
                              CategoryId = d.category_id,
                              Name = e.name,
                              BookId = c.book_id,
                              Judul = d.judul,
                              Pegawai = c.pegawai,
                              TanggalPinjam = c.tanggal_pinjam,
                              TanggalKembali = c.tanggal_kembali,
                              Status = c.status,
                              Penulis = d.pengarang,
                              Penerbit = d.penerbit
                          }).FirstOrDefault();
            }
            return result != null ? result : new PeminjamanViewModel();
        }

        //Create and Edit
        public static ResponseResult Update(PeminjamanViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    #region Create New / Insert
                    if (entity.Id == 0)
                    {
                        x_peminjaman peminjaman = new x_peminjaman();

                        peminjaman.biodata_id = entity.BiodataId;
                        peminjaman.book_id = entity.BookId;
                        peminjaman.pegawai = entity.Pegawai;
                        peminjaman.tanggal_pinjam = entity.TanggalPinjam;
                        peminjaman.tanggal_kembali = entity.TanggalKembali;

                        peminjaman.status = "Dipinjam";

                        peminjaman.created_by = 1;
                        peminjaman.created_on = DateTime.Now;

                        db.x_peminjaman.Add(peminjaman);
                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    #endregion
                }
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Message = ex.Message;
            }
            return result;
        }


        //Delete
        public static ResponseResult Delete(PeminjamanViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    x_peminjaman peminjaman = db.x_peminjaman
                        .Where(o => o.id == entity.Id)
                        .FirstOrDefault();

                    if (peminjaman != null)
                    {
                        peminjaman.deleted_by = 1;
                        peminjaman.deleted_on = DateTime.Now;

                        peminjaman.is_delete = true;

                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    else
                    {
                        result.Success = false;
                        result.Message = "Data Not Found ! ";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Message = ex.Message;
            }
            return result;
        }

        public static List<PeminjamanViewModel> Pinjam()
        {
            List<PeminjamanViewModel> result = new List<PeminjamanViewModel>();
            using (var db = new XContext())
            {
                result = (from c in db.x_peminjaman
                          join d in db.x_book on c.book_id equals d.id
                          join e in db.x_biodata on c.biodata_id equals e.id
                          where c.is_delete == false && c.status == "Dipinjam"
                          select new PeminjamanViewModel
                          {
                              Id = c.id,
                              BiodataId = c.biodata_id,
                              NPM = e.identity_number,
                              FullName = e.fullname,
                              BookId = c.biodata_id,
                              Judul = d.judul,
                              Pegawai = c.pegawai,
                              TanggalPinjam = c.tanggal_pinjam,
                              TanggalKembali = c.tanggal_kembali
                          }).ToList();
            }
            return result;
        }

        public static ResponseResult Pengembalian(long id, string button)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    x_peminjaman permission = db.x_peminjaman
                           .Where(o => o.id == id)
                           .FirstOrDefault();

                    if (id != 0)
                    {
                        permission.status = button;

                        permission.modified_by = 1;
                        permission.modified_on = DateTime.Now;

                        permission.tanggal_dikembalikan = DateTime.Now;

                        db.SaveChanges();
                        //result.Entity = entity;
                    }
                    else
                    {
                        result.Success = false;
                        result.Message = "Not Found ! ";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Message = ex.Message;
            }
            return result;
        }

    }
}
