using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ViewModel;

namespace AssigmentProject.Controllers
{
    public class BiodataController : Controller
    {
        // GET: Biodata
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List()
        {
            return PartialView("_List", BiodataRepo.All());
        }

        public ActionResult Create()
        {
            return PartialView("_Create", new BiodataViewModel());
        }

        [HttpPost]
        public ActionResult Create(BiodataViewModel model)
        {
            ResponseResult result = BiodataRepo.Update(model);
            return Json(new
            {
                success = result.Success,
                message = result.Message,
                entity = result.Entity
            }, JsonRequestBehavior.AllowGet);
        }

    }
}