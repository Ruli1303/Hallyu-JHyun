using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViewModel;

namespace DataAccess
{
    public class PesertaRepo
    {
        public static List<PesertaViewModel> All()
        {
            List<PesertaViewModel> result = new List<PesertaViewModel>();
            using (var db = new XposContext())
            {

                result = (from c in db.tb_peserta
                          where c.Is_delete == false
                          select new PesertaViewModel
                          {
                              id = c.Id,
                              nama = c.Nama,
                              noTelpon = c.No_hp,
                              email = c.Email,
                              tanggalLahir = c.Tanggal_lahir,
                              alamat = c.Alamat,
                              jurusan = c.Jurusan,
                              pertanyaan = c.Pertanyaan
                          }).ToList();
            }
            return result;
        }

        public static PesertaViewModel ById(int id)
        {
            PesertaViewModel result = new PesertaViewModel();
            using (var db = new XposContext())
            {
                result = (from c in db.tb_peserta
                          where c.Id == id
                          select new PesertaViewModel
                          {
                              id = c.Id,
                              nama = c.Nama,
                              noTelpon = c.No_hp,
                              email = c.Email,
                              tanggalLahir = c.Tanggal_lahir,
                              alamat = c.Alamat,
                              jurusan = c.Jurusan,
                              pertanyaan = c.Pertanyaan
                          }).FirstOrDefault();
            }
            return result != null ? result : new PesertaViewModel();
        }

        public static ResponseResult Update(PesertaViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XposContext())
                {
                    #region Create New / Insert
                    if (entity.id == 0)
                    {
                        tb_peserta peserta = new tb_peserta();

                        peserta.Nama = entity.nama;
                        peserta.No_hp = entity.noTelpon;
                        peserta.Email = entity.email;
                        peserta.Tanggal_lahir = entity.tanggalLahir;
                        peserta.Alamat = entity.alamat;
                        peserta.Jurusan = entity.jurusan;

                        peserta.Is_delete = false;

                        peserta.Create_by = "Admin";
                        peserta.Create_on = DateTime.Now;

                        db.tb_peserta.Add(peserta);
                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    #endregion
                    #region
                    else
                    {
                        tb_peserta peserta = db.tb_peserta
                            .Where(o => o.Id == entity.id)
                            .FirstOrDefault();

                        if (peserta != null)
                        {
                            //pelatihan.biodata_id = entity.Id;
                            peserta.Nama = entity.nama;
                            peserta.No_hp = entity.noTelpon;
                            peserta.Email = entity.email;
                            peserta.Tanggal_lahir = entity.tanggalLahir;
                            peserta.Alamat = entity.alamat;
                            peserta.Jurusan = entity.jurusan;

                            peserta.Modified_by = "Admin";
                            peserta.Modified_on = DateTime.Now;

                            db.SaveChanges();

                            result.Entity = entity;
                        }
                        else
                        {
                            result.Success = false;
                            result.Message = "Not Found ! ";
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

        public static ResponseResult Delete(PesertaViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XposContext())
                {
                    tb_peserta peserta = db.tb_peserta
                        .Where(o => o.Id == entity.id)
                        .FirstOrDefault();

                    if (peserta != null)
                    {
                        peserta.Delete_by = "Admin";
                        peserta.Delete_on = DateTime.Now;

                        peserta.Is_delete = true;
                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    else
                    {
                        result.Success = false;
                        result.Message = "Pelatihan Not Found ! ";
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
