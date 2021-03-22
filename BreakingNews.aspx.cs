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
    public partial class BreakingNews : System.Web.UI.Page
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
        public static string saveCate( int active, int language, string News)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            string dateTimeKey = DateTime.Now.ToString("yyyy/MM/dd");
            
            
            
                conn.Open();
                MySqlCommand cmd3 = new MySqlCommand("Insert into  BreakingNews(news,languageId,CreatedDate,Status) values (@news,@languageId,@CreatedDate,@Status)", conn);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@news";
                param4.Value = News;
                cmd3.Parameters.Add(param4);

                MySqlParameter param54 = new MySqlParameter();
                param54.ParameterName = "@languageId";
                param54.Value = language;
                cmd3.Parameters.Add(param54);

                MySqlParameter param547 = new MySqlParameter();
                param547.ParameterName = "@CreatedDate";
                param547.Value = dateTimeKey;
                cmd3.Parameters.Add(param547);

                MySqlParameter param5478 = new MySqlParameter();
                param5478.ParameterName = "@Status";
                param5478.Value = active;
                cmd3.Parameters.Add(param5478);






                Int64 rf = Convert.ToInt64(cmd3.ExecuteScalar());

             



                conn.Close();
            
            


          
           

            //var queryStr = "SELECT OtherLanguageText from tbotherlanguage where LanguageId=" + language + " AND PrimaryKeyId = '"+ Categories + "' AND TableId = '1';";

            //MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            //conn.Open();
            //var dr = cmd.ExecuteReader();
            //var OtherLan = "";
            //if (dr.HasRows)
            //{
            // dr.Read();
            //OtherLan = dr.GetString(0);

            ///}
            //dr.Close();// Close reader.
            //conn.Close();

            //conn.Open();
            //MySqlCommand cmd34 = new MySqlCommand("UPDATE homearticlecategory set displayText = @displayText WHERE id = '" + rf + "'", conn);


            // MySqlParameter param444 = new MySqlParameter();
            //param444.ParameterName = "@displayText";
            //param444.Value = OtherLan;
            //cmd34.Parameters.Add(param444);





            //MySqlDataReader log = cmd34.ExecuteReader();
            //conn.Close();


            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rf);



        }

        [WebMethod()]
        public static string GetAllNews(int Language)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter("SELECT a.id,a.news,a.CreatedDate,a.Status, b.Language FROM breakingnews a, tblanguage b  WHERE   a.languageId = b.id AND a.languageId='" + Language + "'", conn))

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
                MySqlCommand cmd3 = new MySqlCommand("UPDATE breakingnews set Status = @status WHERE id = '" + id + "'", conn);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@status";
                param4.Value = 1;
                cmd3.Parameters.Add(param4);





                MySqlDataReader log = cmd3.ExecuteReader();
                conn.Close();

            var e = "done";
            






            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(e);



        }


        [WebMethod()]
        public static string UpdateActiveNo(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE breakingnews set Status = @status WHERE id = '" + id + "'", conn);


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