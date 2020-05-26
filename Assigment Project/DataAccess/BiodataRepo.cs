using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViewModel;

namespace DataAccess
{
    public class BiodataRepo
    {
        //GetAll
        public static List<BiodataViewModel> All()
        {
            List<BiodataViewModel> result = new List<BiodataViewModel>();
            using (var db = new XContext())
            {
                result = (from c in db.x_biodata
                          select new BiodataViewModel
                          {
                              Id = c.id,
                              FullName = c.fullname,
                              NPM = c.identity_number,
                              Pob = c.pob,
                              Dob = c.dob,
                              Gender = c.gender,
                              Religion = c.religion,
                              Email = c.email,
                              Phone_number = c.phone_number1,
                              Faculty = c.faculty,
                              Major = c.major
                          }).ToList();
            }
            return result;
        }

        //Get By Id
        public static BiodataViewModel ById(int Id)
        {
            BiodataViewModel result = new BiodataViewModel();
            using (var db = new XContext())
            {
                result = (from c in db.x_biodata
                          where c.id == Id
                          select new BiodataViewModel
                          {
                              Id = c.id,
                              FullName = c.fullname,
                              NPM = c.identity_number,
                              Pob = c.pob,
                              Dob = c.dob,
                              Gender = c.gender,
                              Religion = c.religion,
                              Email = c.email,
                              Phone_number = c.phone_number1,
                              Faculty = c.faculty,
                              Major = c.major
                          }).FirstOrDefault();
            }
            return result != null ? result : new BiodataViewModel();
        }

        //Create and Update
        public static ResponseResult Update(BiodataViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    #region Create New / Insert
                    if (entity.Id == 0)
                    {
                        x_biodata biodata = new x_biodata();
                        biodata.identity_number = entity.NPM;
                        biodata.fullname = entity.FullName;
                        biodata.pob = entity.Pob;
                        biodata.dob = entity.Dob;
                        biodata.gender = entity.Gender;
                        biodata.religion = entity.Religion;
                        biodata.email = entity.Email;
                        biodata.phone_number1 = entity.Phone_number;
                        biodata.faculty = entity.Faculty;
                        biodata.major = entity.Major;

                        biodata.is_delete = false;

                        biodata.created_by = 1;
                        biodata.created_on = DateTime.Now;

                        db.x_biodata.Add(biodata);
                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    #endregion
                    #region Edit
                    else
                    {
                        x_biodata biodata = db.x_biodata
                            .Where(o => o.id == entity.Id)
                            .FirstOrDefault();

                        if (biodata != null)
                        {
                            biodata.identity_number = entity.NPM;
                            biodata.fullname = entity.FullName;
                            biodata.pob = entity.Pob;
                            biodata.dob = entity.Dob;
                            biodata.gender = entity.Gender;
                            biodata.religion = entity.Religion;
                            biodata.email = entity.Email;
                            biodata.phone_number1 = entity.Phone_number;
                            biodata.faculty = entity.Faculty;
                            biodata.major = entity.Major;

                            biodata.modified_by = 1;
                            biodata.modified_on = DateTime.Now;

                            db.SaveChanges();

                            result.Entity = entity;
                        }
                        else
                        {
                            result.Success = false;
                            result.Message = "Data Not Found ! ";
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
        public static ResponseResult Delete(BiodataViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    x_biodata biodata  = db.x_biodata
                        .Where(o => o.id == entity.Id)
                        .FirstOrDefault();

                    if (biodata != null)
                    {
                        biodata.delete_by = 1;
                        biodata.delete_on = DateTime.Now;

                        biodata.is_delete = true;

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
