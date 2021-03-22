using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Collections;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class ArticlesLoad : System.Web.UI.Page
    {

        static string conString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {
            Hashtable user = (Hashtable)Session["user"];
            UserRoles userRole = (UserRoles)user["Usertype"];
            if (userRole == UserRoles.Admin || userRole == UserRoles.Editor || userRole == UserRoles.Author)
            {

            }
            else
            {
                Response.Redirect("~/AdminLogin.aspx");
            }
        }



        [WebMethod()]
        public static string loadCategory1()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article_category", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }


        [WebMethod()]
        public static string loadCategory2()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article_category", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }


        [WebMethod()]
        public static string loadCategory3()
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article_category", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        [WebMethod()]
        public static string loadsubcategory1(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                 "SELECT * FROM article_subcategory WHERE  ArticleCat_ID='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string loadsubcategory2(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                 "SELECT * FROM article_subcategory WHERE  ArticleCat_ID='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string loadsubcategory3(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                 "SELECT * FROM article_subcategory WHERE  ArticleCat_ID='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        [WebMethod()]
        public static string loadgrid(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(





                //"SELECT author.id,Title,Auth_name,CreatedDate  FROM article INNER JOIN  author ON article.Author_ID = author.id WHERE ArticleSubCat_ID='" + id + "' ", conn))

                "SELECT author.id As Au_id,article.id As Art_id,Title,Name,CreatedDate  FROM article INNER JOIN  author ON article.Author_ID = author.id WHERE ArticleSubCat_ID='" + id + "' ", conn))







            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        [WebMethod()]
        public static string getaddtagdtl(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(


                //"SELECT author.id as aid, Auth_name,Title, article.id  as Aid " + "FROM author " +"INNER JOIN  article ON author.id = article.Author_ID WHERE author.id  = '" + id + "'", conn))



                "SELECT author.id as aid, Name,Title, article.id  as Aid " +
                "FROM author " +
                "INNER JOIN  article ON author.id = article.Author_ID WHERE author.id  = '" + id + "'", conn))

               // "Select id,keyword ,keyword_1,keyword_2 from article_keyword WHERE  id='" + id + "' ", conn))



            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }



      





        [WebMethod()]


        public static string SaveAddtag(string Keyword, string Keyword_1, string Keyword_2, string Article_ID)

        {
            {


                MySqlConnection conn = new MySqlConnection(conString);
                conn.Open();


                MySqlCommand cmd = new MySqlCommand("Insert into article_keyword(Keyword,Keyword_1,Keyword_2,Article_ID) values (@pkeyword,@pkeyword1,@pkeyword2, @paid)", conn);


                MySqlParameter param1 = new MySqlParameter();
                param1.ParameterName = "@pkeyword";
                param1.Value = Keyword;
                cmd.Parameters.Add(param1);

                MySqlParameter param11 = new MySqlParameter();
                param11.ParameterName = "@pkeyword1";
                param11.Value = Keyword_1;
                cmd.Parameters.Add(param11);

                MySqlParameter param12 = new MySqlParameter();
                param12.ParameterName = "@pkeyword2";
                param12.Value = Keyword_2;
                cmd.Parameters.Add(param12);

                MySqlParameter param2 = new MySqlParameter();
                param2.ParameterName = "@paid";
                param2.Value = Article_ID;
                cmd.Parameters.Add(param2);



                int rf = cmd.ExecuteNonQuery();

                conn.Close();




                var data = new { status = (rf > 0) };

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return js.Serialize(data);
            }
        }


        [WebMethod()]
        public static string loadgrid2(string id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(





                //"SELECT author.id,Title,Auth_name,CreatedDate  FROM article INNER JOIN  author ON article.Author_ID = author.id WHERE ArticleSubCat_ID='" + id + "' ", conn))

                "SELECT id, Keyword, Keyword_1, Keyword_2   FROM article_keyword  WHERE Article_ID='" + id + "' ", conn))







            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }







        [WebMethod()]
        public static string getkeywords(string id)

        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter(
                    "Select id,keyword,keyword_1,keyword_2 from article_keyword WHERE  Article_ID='" + id + "' ", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();


                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);
            }

        }





        [WebMethod()]
        public static string UpdateKeytags(string Keyword, string Keyword_1, string Keyword_2, string id)
        {


            MySqlConnection conn = new MySqlConnection(conString);

            conn.Open();

            MySqlCommand cmd = new MySqlCommand(
                "UPDATE article_keyword SET Keyword = @pkey, Keyword_1 = @pkey1,Keyword_2 = @pkey2,  WHERE id='" + id + "' ", conn);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@pkey";
            param1.Value = Keyword;
            cmd.Parameters.Add(param1);

            MySqlParameter param13 = new MySqlParameter();
            param13.ParameterName = "@pkey1";
            param13.Value = Keyword_1;
            cmd.Parameters.Add(param13);

            MySqlParameter param14 = new MySqlParameter();
            param14.ParameterName = "@pkey2";
            param14.Value = Keyword_2;
            cmd.Parameters.Add(param14);





            int rf = cmd.ExecuteNonQuery();
            conn.Close();


            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);
        }







                [WebMethod()]
                public static string popupdeletetag(string id)

                {
                    MySqlConnection conn = new MySqlConnection(conString);
                    conn.Open();

                    MySqlCommand cmd = new MySqlCommand("Delete from 	article_keyword WHERE  id='" + id + "' ", conn);

                    int rf = cmd.ExecuteNonQuery();

                    conn.Close();


                    var data = new { status = (rf > 0) };

                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return js.Serialize(data);

                }




    }
}












