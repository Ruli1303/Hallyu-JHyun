using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewModel;

namespace AssigmentProject.Controllers
{
    public class BookController : Controller
    {
        // GET: Book
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return PartialView("_List", BookRepo.All());
        }

        public ActionResult Create()
        {
            ViewBag.CategoryList = new SelectList(CategoryRepo.All(), "Id", "Name");
            return PartialView("_Create", new BookViewModel());
        }

        [HttpPost]
        public ActionResult Create(BookViewModel model)
        {
            ResponseResult result = BookRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit(int id)
        {
            // id => Variant Id
            BookViewModel model = BookRepo.ById(id);
            ViewBag.CategoryList = new SelectList(CategoryRepo.All(), "Id", "Name");
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(BookViewModel model)
        {
            ResponseResult result = BookRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            return PartialView("_Delete", BookRepo.ById(id));
        }

        [HttpPost]
        public ActionResult Delete(BookViewModel model)
        {
            ResponseResult result = BookRepo.Delete(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Detail(int id)
        {
            return PartialView("_Detail", BookRepo.ById(id));
        }
    }
}