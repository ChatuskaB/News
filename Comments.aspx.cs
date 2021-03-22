using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class Comments : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

            Hashtable user = (Hashtable)Session["user"];
            if (user == null)
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
            else
            {
                SiteMaster.UserRoles userRole = (UserRoles)user["Usertype"];
                if (userRole == UserRoles.Admin || userRole == UserRoles.Editor)
                {

                }
                else
                {
                    Response.Redirect("~/AdminLogin.aspx");
                }
            }

        }



        static string ConString = ConfigurationManager.AppSettings["ConString"];


        [WebMethod()]
        public static string loadComments(String Date, String Date1, int Status)
        {
            var DateTime = Date + " 00:00:00";
            var DateTime1 = Date1 + " 23:59:59";

            if (Date == "" || Date1 == "")
            {
                System.Web.Script.Serialization.JavaScriptSerializer js8 = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js8.Serialize("0");
            }

            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id WHERE comments.status = '" + Status + "' AND comments.date BETWEEN '" + DateTime + "' AND '" + DateTime1 + "'", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }



        [WebMethod()]
        public static string ViewloadComments(String id)
        {

            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id WHERE comments.article_id = '" + id + "' ", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }











        //[WebMethod()]
        //public static string gridchange()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        [WebMethod()]
        public static string getcustomerdt(string Id)

        {
            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.status, article_category.Category1, article.Title, article.Content FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id WHERE comments.id  = '" + Id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }

        [WebMethod()]
        public static string Updater(string status, int Id)
        {
            
            MySqlConnection conn = new MySqlConnection(ConString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(
                "UPDATE  comments SET status=@pstatus  WHERE id='" + Id + "' ", conn);

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@pstatus";
            param7.Value = status;
            cmd.Parameters.Add(param7);

            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);


        }


        //[WebMethod()]
        //public static string approved()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id  AND article.ArticleCat_ID = article_category.id WHERE comments.status = 1 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}



        //[WebMethod()]
        //public static string pending()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id  AND article.ArticleCat_ID = article_category.id WHERE comments.status = 0 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        //[WebMethod()]
        //public static string notapproved()
        //{
        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id WHERE comments.status = 2 ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}


        //[WebMethod()]
        //public static string datebased(string Date, string Date1)
        //{
        //    var DateTime = Date + " 00:00:00";
        //    var DateTime1 = Date1 + " 23:59:59";

        //    MySqlConnection conn = new MySqlConnection(ConString);
        //    conn.Open();

        //    using (MySqlDataAdapter a = new MySqlDataAdapter(


        //        "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id WHERE comments.date BETWEEN '" + DateTime + "' AND '" + DateTime1 + "' ", conn))
        //    {
        //        DataTable t = new DataTable();
        //        a.Fill(t);
        //        conn.Close();

        //        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        //        return JsonConvert.SerializeObject(t);

        //    }
        //}

        [WebMethod()]
        public static string loadCurrentDayPending(string Date, string Date1, int Status)
        {
            var DateTime = Date + " 00:00:00";
            var DateTime1 = Date1 + " 23:59:59";

            MySqlConnection conn = new MySqlConnection(ConString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT comments.id, comments.name, comments.email, comments.comment, comments.usertype, comments.date, comments.status, article_category.Category1, article.Title FROM comments INNER JOIN article INNER JOIN article_category ON comments.article_id = article.id AND article.ArticleCat_ID = article_category.id WHERE comments.status = '" + Status + "' AND comments.date BETWEEN '" + DateTime + "' AND '" + DateTime1 + "'", conn))
            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
        }

    }

}
   
