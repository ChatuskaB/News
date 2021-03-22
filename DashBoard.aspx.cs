using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using static NewsWebsiteAdmin.SiteMaster;
using System.Configuration;
using MySql.Data.MySqlClient;


namespace NewsWebsiteAdmin
{
    public partial class DashBoard : System.Web.UI.Page
    {
        public enum UserRoles
        {

            NonUser = 0,
            Reader = 1,
            Author = 2,
            Admin = 3,
            Editor = 4,


        }



        static string ConString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["user"] != null)
            {
                Hashtable user = (Hashtable)Session["user"];
                loadMenu(user);

            }
            else
            {
                Response.Redirect("~/AdminLogin.aspx");
            }

        }





        private void loadMenu(Hashtable user)
        {
            UserRoles userRole = (UserRoles)user["Usertype"];

            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();
            string sql = "SELECT " + userRole + " FROM user_login";
            using (MySqlDataAdapter a = new MySqlDataAdapter(sql, conn))
            {

                conn.Close();


                if (userRole == UserRoles.Admin)
                {

                    admin.Visible = true;
                    author.Visible = false;
                    edditer.Visible = false;


                }
                if (userRole == UserRoles.Author)
                {

                    admin.Visible = false;
                    author.Visible = true;
                    edditer.Visible = false;



                }
                if (userRole == UserRoles.Editor)
                {

                    admin.Visible = false;
                    author.Visible = false;
                    edditer.Visible = true;

                }



            }

        }


    }
}