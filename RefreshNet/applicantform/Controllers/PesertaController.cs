using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewModel;

namespace applicantform.Controllers
{
    public class PesertaController : Controller
    {
        // GET: Peserta
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return PartialView("_List", PesertaRepo.All());
        }

        public ActionResult Create()
        {
            return View("_Form", new PesertaViewModel());
        }

        [HttpPost]
        public ActionResult Create(PesertaViewModel model)
        {
            ResponseResult result = PesertaRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Edit(int id)
        {
            PesertaViewModel model = PesertaRepo.ById(id);
            return PartialView("_Edit", model);
        }

        [HttpPost]
        public ActionResult Edit(PesertaViewModel model)
        {
            ResponseResult result = PesertaRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            return PartialView("_Delete", PesertaRepo.ById(id));
        }

        [HttpPost]
        public ActionResult Delete(PesertaViewModel model)
        {
            ResponseResult result = PesertaRepo.Delete(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Detail(int id)
        {
            return PartialView("_Detail", PesertaRepo.ById(id));
        }

        /*public ActionResult Form()
        {
            return View();
        }*/

    }
}