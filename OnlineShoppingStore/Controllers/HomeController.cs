using Newtonsoft.Json;
using OnlineShoppingStore.DAL;
using OnlineShoppingStore.Models;
using OnlineShoppingStore.Repository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace OnlineShoppingStore.Controllers
{
    public class HomeController : Controller
    {
        dbMyOnlineShoppingEntities db = new dbMyOnlineShoppingEntities();

        // GET: UserDetail
        //Login Authentication
        //Only able access this Actionmethod when User Log in
        [Authorize]
        public ActionResult UserDetail()
        {
            return View();
        }
      
        // GET:Login 
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        //Post:Login 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginViewModel LoginViewModel)
        {
            if (IsAuthenitcatedUser(LoginViewModel.Email, LoginViewModel.Password))
            {
                //MVC and Login Authentication
                FormsAuthentication.SetAuthCookie(LoginViewModel.Email, false);
               return RedirectToAction("UserDetail", "Home");
              

              
            }
            else
            {
                ModelState.AddModelError("", "Your credentail is incorrect");
            }
            return View(LoginViewModel);
        }
        // GET:Register return view
        [HttpGet]
        public ActionResult UserRegistration()
        {
            return View();
        }
        // Post:Register 
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult UserRegistration(RegistrationViewModel RegistrationViewModel)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (!IsEmailExist(RegistrationViewModel.Email))
                    {
                        using (dbMyOnlineShoppingEntities db = new dbMyOnlineShoppingEntities())
                        {
                            Company_Users userobj = new Company_Users
                            {
                                Email = RegistrationViewModel.Email,
                                Name = RegistrationViewModel.Name,
                                //for encryption you should use a strong and secure Algorithm
                                // I'm simply using Base64 for explanation purpose
                                Encryptedpassword = Base64Encode(RegistrationViewModel.Password),
                                Address = RegistrationViewModel.Address
                            };
                            db.Company_Users.Add(userobj);
                            if (db.SaveChanges() > 0)
                            {
                                //Set MVC and Login Authentication
                                FormsAuthentication.SetAuthCookie(RegistrationViewModel.Email, false);
                                return RedirectToAction("UserDetail", "Home");
                            }
                            else
                            {
                                ModelState.AddModelError("", "Something went wrong please try again later!");
                            }
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("", "email already exist please try with diffrent one!");
                    }

                }
                else
                {
                    ModelState.AddModelError("", "Model is Invalid");
                }
            }
            catch (Exception e)
            {
                ModelState.AddModelError("", e.Message);
            }
            return View();
        }
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }

        private bool IsEmailExist(string email)
        {
            bool IsEmailExist = false;
            using (dbMyOnlineShoppingEntities db = new dbMyOnlineShoppingEntities())
            {
                int count = db.Company_Users.Where(a => a.Email == email).Count();
                if (count > 0)
                {
                    IsEmailExist = true;
                }
            }
            return IsEmailExist;
        }
        private bool IsAuthenitcatedUser(string email, string password)
        {
            var encryptpassowrd = Base64Encode(password);
            bool IsValid = false;
            using (dbMyOnlineShoppingEntities db = new dbMyOnlineShoppingEntities())
            {
                int count = db.Company_Users.Where(a => a.Email == email && a.Encryptedpassword == encryptpassowrd).Count();
                if (count > 0)
                {
                    IsValid = true;
                }
            }
            return IsValid;
        }
        private static string Base64Encode(string PlainPassword)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(PlainPassword);
            return System.Convert.ToBase64String(plainTextBytes);
        }

  
public ActionResult Index(string search, int? page)
        {
            HomeIndexViewModel model = new HomeIndexViewModel();
            return View(model.CreateModel(search, 4, page));
        }

        public ActionResult Contact()
        {
            
            return View();
        
        }
        public ActionResult About()
        {

            return View();

        }

        public ActionResult AddToCart(int productId)
        {
            if (Session["cart"] == null)
            {
                List<Item> cart = new List<Item>();
                var product = db.Tbl_Product.Find(productId);
                cart.Add(new Item()
                {
                    Product = product,
                    Quantity = 1
                });
                Session["cart"] = cart;
            }
            else
            {
                List<Item> cart = (List<Item>)Session["cart"];
                var product = db.Tbl_Product.Find(productId);
                cart.Add(new Item()
                {
                    Product = product,
                    Quantity = 1
                });
                Session["cart"] = cart;
            }
            return Redirect("Index");
        }



        public ActionResult RemoveFromCart(int productId)
        {
            List<Item> cart = (List<Item>)Session["cart"];
            foreach (var item in cart)
            {
                if (item.Product.ProductId == productId)
                {
                    cart.Remove(item);
                    break;
                }
            }
            Session["cart"] = cart;
            return Redirect("Index");
        }
    }
}