using ExpenseManager.App_Start;
using Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExpenseManager
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            SecurityConfig.Configure(app);
            WebApiConfig.Configure(app);
        }
    }
}