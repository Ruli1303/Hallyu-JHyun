using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewModel;

namespace AssigmentProject.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult List()
        {
            return PartialView("_List", CategoryRepo.All());
        }

        public ActionResult Create()
        {
            return PartialView("_Create", new CategoryViewModel());
        }

        [HttpPost]
        public ActionResult Create(CategoryViewModel model)
        {
            
                ResponseResult result = CategoryRepo.Update(model);
                return Json(new
                {
                    success = result.Success,
                    message = result.Message,
                    entity = result.Entity
                }, JsonRequestBehavior.AllowGet);

        }

        public ActionResult Edit(int id)
        {
            //id => Category Id
            return PartialView("_Edit", CategoryRepo.ById(id));
        }

        [HttpPost]
        public ActionResult Edit(CategoryViewModel model)
        {
            ResponseResult result = CategoryRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            return PartialView("_Delete", CategoryRepo.ById(id));
        }

        [HttpPost]
        public ActionResult Delete(CategoryViewModel model)
        {
            ResponseResult result = CategoryRepo.Delete(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

    }
}