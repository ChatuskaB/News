using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class AddHomeArticle : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.AppSettings["ConString"];

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







        [WebMethod()]
        public static string loadArticle()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string AddArticle(int id , int active)
        {
            string dateNow = DateTime.Now.ToString("yyyy/MM/dd");
            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("Insert into  EditPickupsArticle(createdDate,status,articleId) values (@createdDate,@status,@articleId)", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@createdDate";
            param4.Value = dateNow;
            cmd3.Parameters.Add(param4);

            MySqlParameter param54 = new MySqlParameter();
            param54.ParameterName = "@status";
            param54.Value = active;
            cmd3.Parameters.Add(param54);

            MySqlParameter param54w = new MySqlParameter();
            param54w.ParameterName = "@articleId";
            param54w.Value = id;
            cmd3.Parameters.Add(param54w);





            Int64 rf = Convert.ToInt64(cmd3.ExecuteScalar());

            conn.Close();

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rf);
        }

        [WebMethod()]
        public static string loadarticleTable()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT a.id,a.createdDate, a.status , b.Title FROM EditPickupsArticle a, article b  WHERE a.articleId = b.id ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string UpdateActive(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE EditPickupsArticle set status = @status WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@status";
            param4.Value = 1;
            cmd3.Parameters.Add(param4);





            MySqlDataReader log = cmd3.ExecuteReader();
            conn.Close();



            var rff = "ds";
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rff);



        }

        [WebMethod()]
        public static string UpdateActiveNo(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE EditPickupsArticle set status = @status WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@status";
            param4.Value = 0;
            cmd3.Parameters.Add(param4);





            MySqlDataReader log = cmd3.ExecuteReader();
            conn.Close();



            var rff = "ds";
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rff);



        }
    }
}