using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewModel;

namespace AssigmentProject.Controllers
{
    public class PeminjamanController : Controller
    {
        // GET: Peminjaman
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return PartialView("_List", PeminjamanRepo.Pinjam());
        }

        public ActionResult GetByCategory(long categoryId)
        {
            return View(BookRepo.ByCategory(categoryId));
        }

        public ActionResult Create()
        {
            ViewBag.BiodataList = new SelectList(BiodataRepo.All(), "Id", "NPM");
            ViewBag.CategoryList = new SelectList(CategoryRepo.All(), "Id", "Name");
            ViewBag.BookList = new SelectList(BookRepo.ByCategory(0), "Id", "Judul");
            return PartialView("_Create", new PeminjamanViewModel());
        }

        [HttpPost]
        public ActionResult Create(PeminjamanViewModel model)
        {
            ResponseResult result = PeminjamanRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }


        public ActionResult Delete(int id)
        {
            return PartialView("_Delete", PeminjamanRepo.ById(id));
        }

        [HttpPost]
        public ActionResult Delete(PeminjamanViewModel model)
        {
            ResponseResult result = PeminjamanRepo.Delete(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult History()
        {
            return View("_History", PeminjamanRepo.All());
        }
        public ActionResult Detail(int id)
        {
            return PartialView("_Detail", PeminjamanRepo.ById(id));
        }

        public ActionResult Pengembalian(int Id)
        {
            return PartialView("_List", PeminjamanRepo.ById(Id));
        }

        [HttpPost]
        public ActionResult Pengembalian(long id, string app)
        {
            ResponseResult result = PeminjamanRepo.Pengembalian(id, app);

            return Json(new
            {
                success = result.Success,
                message = result.Message,
                //      entity = result.Entity
            }, JsonRequestBehavior.AllowGet);

        }

    }
}