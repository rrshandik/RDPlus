using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace RDPplus
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        public static void RegisterRoutes(RouteCollection routes)
        {
            // Default route
            routes.MapPageRoute("DefaultRoute", "", "~/Pages/Login/Login.aspx");

            // Route to Home.aspx without specifying full path
            routes.MapPageRoute("HomeRoute", "homepage", "~/Pages/Home/Home.aspx");
            routes.MapPageRoute("LoginRoute", "adminLogin", "~/Pages/Login/Login.aspx");
            routes.MapPageRoute("EmployeeDataRoute", "employee-data", "~/Pages/Employee Data/employee-data.aspx");


            // Add more routes
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}