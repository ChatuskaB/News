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
    public partial class ArticleApprove : System.Web.UI.Page
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
                if (userRole == UserRoles.Admin || userRole == UserRoles.Editor || userRole == UserRoles.Author)
                {

                }
                else
                {
                    Response.Redirect("~/AdminLogin.aspx");
                }
            }


        }









        [WebMethod()]
        public static string loadLanguage()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM tblanguage", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string loadCategories(int LanguageId)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM tbotherlanguage WHERE TableId = '1' AND LanguageId='" + LanguageId + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string loadSubCategories(int LanguageId , int categoryId)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


               "SELECT a.id, b.OtherLanguageText,b.PrimaryKeyId  FROM article_subcategory a, tbotherlanguage b  WHERE a.ArticleCat_ID = '" + categoryId + "' AND a.id = b.PrimaryKeyId AND b.LanguageId = '" + LanguageId + "' AND b.TableId = '2'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        [WebMethod()]
        public static string LoadArticle(int Language, int category, int subcategory,String fdate,String tdate,String article)
        {
            Hashtable user = (Hashtable)HttpContext.Current.Session["user"];
            UserRoles userRole = (UserRoles)user["Usertype"];
            int ID = (int)user["Id"];


            var DateTime = fdate + " 00:00:00";
            var DateTime1 = tdate + " 23:59:59";


            //string SQL = "SELECT a.id, a.Title, a.isPublished, a.CreatedDate, b.Name, article_category.Category1  FROM article a, author b, article_category  WHERE a.Author_id = b.id AND a.ArticleCat_ID = article_category.id";

            string SQL = "SELECT a.id, a.Title, a.isPublished, a.CreatedDate, b.Name, article_category.Category1,article_subcategory.SubCategory1 FROM article a, author b, article_category,article_subcategory WHERE a.Author_id = b.id AND a.ArticleCat_ID = article_category.id AND a.ArticleSubCat_ID = article_subcategory.id";


            if (userRole == UserRoles.Author )
            {
                SQL += " AND b.User_ID = '" + ID + "'";
            }
            if (Language != 0)
            {
                SQL += " AND a.languageid = '" + Language + "'";
            }
            if (category != 0)
            {
                SQL += "AND a.ArticleCat_ID = '" + category + "'";
            }
            if (fdate != "" && tdate != "")
            {
                SQL += "AND (a.CreatedDate BETWEEN '" + DateTime + "' AND '" + DateTime1 + "')";
            }
            if (subcategory != 0)
            {
                SQL += "AND a.ArticleSubCat_ID = '" + subcategory + "'";
            }
            if (article != "")
            {
                SQL += "AND (a.Title LIKE '%" + article + "%')";
            }


            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(SQL, conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string GetArticleEdit(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


               "SELECT a.id,a.Title,a.isPublished,a.CreatedDate,a.Content, b.Name  FROM article a, author b  WHERE a.Author_id = b.id AND  a.id = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string LoadArticledefailt()
        {
            Hashtable user = (Hashtable)HttpContext.Current.Session["user"];
            UserRoles userRole = (UserRoles)user["Usertype"];
            int ID = (int)user["Id"];

            //string SQL = "SELECT a.id, a.Title, a.isPublished, a.CreatedDate, b.Name, article_category.Category1  FROM article a, author b, article_category  WHERE a.Author_id = b.id AND a.ArticleCat_ID = article_category.id";

            string SQL = "SELECT a.id, a.Title, a.isPublished, a.CreatedDate, b.Name, article_category.Category1,article_subcategory.SubCategory1 FROM article a, author b, article_category,article_subcategory WHERE a.Author_id = b.id AND a.ArticleCat_ID = article_category.id AND a.ArticleSubCat_ID = article_subcategory.id";
            

            if (userRole == UserRoles.Author)
            {
                SQL += " AND b.User_ID = '" + ID + "'";
            }

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();


            using (MySqlDataAdapter a = new MySqlDataAdapter(

            SQL, conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }
            
             //ORDER BY a.CreatedDate DESC"
        }

        [WebMethod()]
        public static string UpdateActive(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE article set isPublished = @isPublished WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@isPublished";
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
            MySqlCommand cmd3 = new MySqlCommand("UPDATE article set isPublished = @isPublished WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@isPublished";
            param4.Value = 0;
            cmd3.Parameters.Add(param4);





            MySqlDataReader log = cmd3.ExecuteReader();
            conn.Close();



            var rff = "ds";
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rff);



        }

        [WebMethod()]
        public static string UpdateArticle(int id, string Title, string content)
        {
            string dateTimeKey = DateTime.Now.ToString("yyyy/MM/dd");
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE article set Title = @Title, Content = @Content,PublishedDate = @PublishedDate WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@Title";
            param4.Value = Title;
            cmd3.Parameters.Add(param4);

            MySqlParameter param54 = new MySqlParameter();
            param54.ParameterName = "@Content";
            param54.Value = content;
            cmd3.Parameters.Add(param54);

            MySqlParameter param54r = new MySqlParameter();
            param54r.ParameterName = "@PublishedDate";
            param54r.Value = dateTimeKey;
            cmd3.Parameters.Add(param54r);



            MySqlDataReader log = cmd3.ExecuteReader();
            conn.Close();

        

            var rff = "ds";
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rff);



        }
    }
}