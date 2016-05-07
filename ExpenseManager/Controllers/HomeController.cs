using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ExpenseManager.Controllers
{
    public class HomeController : ApiController
    {
        [Authorize]
        public IHttpActionResult Get()
        {
            var user = Request.GetOwinContext().Authentication.User;
            return Ok("Hello Web Api From " + user.Identity.Name);
            //return Ok("Hello Web Api From ");
        }
    }
}
