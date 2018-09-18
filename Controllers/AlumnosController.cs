using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication2.Controllers
{
    public class AlumnosController : Controller
    {
        // GET: Alumnos
        public ActionResult Index()
        {
            var db = new ColegioEntities1();
            
            return View(db.Alumnos.ToList());
        }

        public ActionResult CreateAlumn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateAlumn(Alumnos a)
        {
            if (!ModelState.IsValid) return View();

            try
            {
                var db = new ColegioEntities1();
                a.fecha_registro = DateTime.Now;
                db.Alumnos.Add(a);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("","Error: "+ex.Message);
                return View();
            }
         
        }

        public ActionResult EditAlumno(int id)
        {
            using (var db = new ColegioEntities1())
            {
                return View(db.Alumnos.Find(id));
            }
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditAlumno(Alumnos a)
        {
            if (!ModelState.IsValid) return View();
            using (var db = new ColegioEntities1())
            {
                var al = db.Alumnos.Find(a.id);
                al.nombre = a.nombre;
                al.apellido1 = a.apellido1;
                al.edad = a.edad;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        public ActionResult DetailsAlumn(int id)
        {
            using (var db = new ColegioEntities1())
            {
                var al = db.Alumnos.Find(id);
                return View(al);
            }
        }

        public ActionResult DeleteAlumn(int id)
        {
            using (var db = new ColegioEntities1())
            {
                var al = db.Alumnos.Find(id);
                db.Alumnos.Remove(al);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

    }
}