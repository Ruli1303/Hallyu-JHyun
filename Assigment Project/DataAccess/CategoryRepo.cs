﻿using DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ViewModel;

namespace DataAccess
{
    public class CategoryRepo
    {
        //GetAll
        public static List<CategoryViewModel> All()
        {
            List<CategoryViewModel> result = new List<CategoryViewModel>();
            using (var db = new XContext())
            {
                result = (from c in db.x_category
                          where c.is_delete == false
                          select new CategoryViewModel
                          {
                              Id = c.Id,
                              Initial = c.initial,
                              Name = c.name,
                              Description = c.description
                          }).ToList();
            }
            return result;
        }

        //GetById
        public static CategoryViewModel ById(int Id)
        {
            CategoryViewModel result = new CategoryViewModel();
            using (var db = new XContext())
            {
                result = (from c in db.x_category
                          where c.Id == Id
                          select new CategoryViewModel
                          {
                              Id = c.Id,
                              Initial = c.initial,
                              Name = c.name,
                              Description = c.description
                          }).FirstOrDefault();
            }
            return result != null ? result : new CategoryViewModel();
        }

        //Create and Update
        public static ResponseResult Update(CategoryViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    #region Create New / Insert
                    if (entity.Id == 0)
                    {
                        x_category category = new x_category();
                        category.initial = entity.Initial;
                        category.name = entity.Name;
                        category.description = entity.Description;

                        category.is_delete = false;

                        category.created_by = 1;
                        category.created_on = DateTime.Now;

                        db.x_category.Add(category);
                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    #endregion
                    #region Edit
                    else
                    {
                        x_category category = db.x_category
                            .Where(o => o.Id == entity.Id)
                            .FirstOrDefault();

                        if (category != null)
                        {
                            category.initial = entity.Initial;
                            category.name = entity.Name;
                            category.description = entity.Description;

                            category.modified_by = 1;
                            category.modified_on = DateTime.Now;

                            db.SaveChanges();

                            result.Entity = entity;
                        }
                        else
                        {
                            result.Success = false;
                            result.Message = "Category Not Found ! ";
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
        public static ResponseResult Delete(CategoryViewModel entity)
        {
            ResponseResult result = new ResponseResult();
            try
            {
                using (var db = new XContext())
                {
                    x_category category = db.x_category
                        .Where(o => o.Id == entity.Id)
                        .FirstOrDefault();

                    if (category != null)
                    {
                        category.delete_by = 1;
                        category.delete_on = DateTime.Now;

                        category.is_delete = true;

                        db.SaveChanges();

                        result.Entity = entity;
                    }
                    else
                    {
                        result.Success = false;
                        result.Message = "Category Not Found ! ";
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
