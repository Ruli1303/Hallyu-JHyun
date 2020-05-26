using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViewModel;

namespace DataAccess
{
    public class BookRepo
    {
        public static List<BookViewModel> All()
        {
            List<BookViewModel> result = new List<BookViewModel>();
            using (var db = new XContext())
            {
                result = (from c in db.x_book
                          join d in db.x_category on c.category_id equals d.Id
                          where c.is_delete == false
                          select new BookViewModel
                          {
                              Id = c.id,
                              CategoryId = c.category_id,
                              CategoryName = d.name,
                              Judul = c.judul,
                              Penerbit = c.penerbit,
                              Pengarang = c.pengarang,
                              Tahun = c.tahun,
                              LokasiRak = c.lokasi_rak,
                              Deskripsi = c.deskripsi

                          }).ToList();
            }
            return result;
        }

        public static BookViewModel ById(int id)
        {
            //Id Variant.Id
            BookViewModel result = new BookViewModel();
            using (var db = new XContext())
            {
                result = (from c in db.x_book
                          where c.id == id
                          select new BookViewModel
                          {
                              Id = c.id,
                              CategoryId = c.category_id,
                              Judul = c.judul,
                              Penerbit = c.penerbit,
                              Pengarang = c.pengarang,
                              Tahun = c.tahun,
                              LokasiRak = c.lokasi_rak,
                              Deskripsi = c.deskripsi
                          }).FirstOrDefault();
            }
            return result != null ? result : new BookViewModel();
        }

        public static List<BookViewModel> ByCategory(long Id)
        {
            //Id Variant.Id
            List<BookViewModel> result = new List<BookViewModel>();
            using (var db = new XContext())
            {
                result = (from c in db.x_book
                          join d in db.x_category
                          on c.category_id equals d.Id
                          where c.category_id == Id && c.is_delete == false
                          select new BookViewModel
                          {
                              Id = c.id,
                              CategoryId = c.category_id,
                              Judul = c.judul,
                              Penerbit = c.penerbit,
                              Pengarang = c.pengarang,
                              Tahun = c.tahun,
                              LokasiRak = c.lokasi_rak,
                              Deskripsi = c.deskripsi
                          }).ToList();
            }
            return result;
        }

        public static ResponseResult Update(BookViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    #region Create New / Insert
                    if (entity.Id == 0)
                    {
                        x_book book = new x_book();

                        book.category_id = entity.CategoryId;
                        book.judul = entity.Judul;
                        book.penerbit = entity.Penerbit;
                        book.pengarang = entity.Pengarang;
                        book.tahun = entity.Tahun;
                        book.lokasi_rak = entity.LokasiRak;
                        book.deskripsi = entity.Deskripsi;

                        book.created_by = 1;
                        book.created_on = DateTime.Now;

                        db.x_book.Add(book);
                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    #endregion

                    #region Edit
                    else
                    {
                        x_book book = db.x_book
                            .Where(o => o.id == entity.Id)
                            .FirstOrDefault();

                        if (book != null)
                        {
                            book.category_id = entity.CategoryId;
                            book.judul = entity.Judul;
                            book.penerbit = entity.Penerbit;
                            book.pengarang = entity.Pengarang;
                            book.tahun = entity.Tahun;
                            book.lokasi_rak = entity.LokasiRak;
                            book.deskripsi = entity.Deskripsi;

                            book.modified_by = 1;
                            book.modified_on = DateTime.Now;

                            db.SaveChanges();

                            result.Entity = entity;

                        }
                        else
                        {
                            result.Success = false;
                            result.Message = "Data Not Found !";
                        }

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
        public static ResponseResult Delete(BookViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    x_book book = db.x_book
                        .Where(o => o.id == entity.Id)
                        .FirstOrDefault();

                    if (book != null)
                    {
                        book.deleted_by = 1;
                        book.deleted_on = DateTime.Now;

                        book.is_delete = true;

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

    }
}
