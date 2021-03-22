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
    public partial class HomeArticleCategories : System.Web.UI.Page
    {
        static string conString = ConfigurationManager.AppSettings["ConString"];
        protected void Page_Load(object sender, EventArgs e)
        {

            Hashtable user = (Hashtable)Session["user"];
            if(user == null)
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
        public static string loadCategories(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM tbotherlanguage WHERE TableId = '1' AND LanguageId='"+id+"'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string LoadLanguage()
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
        public static string saveCate(int Categories, string displayText, int active , int language, int Order)
        {
            MySqlConnection conn1 = new MySqlConnection(conString);
            conn1.Open();
            using (MySqlDataAdapter a = new MySqlDataAdapter("SELECT categoryId,orderCheck FROM homearticlecategory WHERE   categoryId='" + Categories + "' OR orderCheck =  '" + Order + "'", conn1))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn1.Close();


                if (t != null)
                {
                    if (t.Rows.Count > 0)
                    {
                        return JsonConvert.SerializeObject(1);
                    }
                }



            }

 
                    MySqlConnection conn = new MySqlConnection(conString);
                    conn.Open();
                    MySqlCommand cmd3 = new MySqlCommand("Insert into  homearticlecategory(categoryId,displayText,language,orderCheck,isActive) values (@categoryId,@displayText,@language,@orderCheck,@isActive); Select LAST_INSERT_ID()", conn);


                    MySqlParameter param4 = new MySqlParameter();
                    param4.ParameterName = "@categoryId";
                    param4.Value = Categories;
                    cmd3.Parameters.Add(param4);

                    MySqlParameter param54 = new MySqlParameter();
                    param54.ParameterName = "@displayText";
                    param54.Value = displayText;
                    cmd3.Parameters.Add(param54);

                    MySqlParameter param547 = new MySqlParameter();
                    param547.ParameterName = "@language";
                    param547.Value = language;
                    cmd3.Parameters.Add(param547);

                    MySqlParameter param5478 = new MySqlParameter();
                    param5478.ParameterName = "@orderCheck";
                    param5478.Value = Order;
                    cmd3.Parameters.Add(param5478);

                    MySqlParameter param544 = new MySqlParameter();
                    param544.ParameterName = "@isActive";
                    param544.Value = active;
                    cmd3.Parameters.Add(param544);

                    Int64 rf = Convert.ToInt64(cmd3.ExecuteScalar());

                    conn.Close();
                    System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                    return JsonConvert.SerializeObject(rf);



        }




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




        [WebMethod()]
        public static string GetAllcategories(int Language)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter("SELECT a.id,a.categoryId,a.orderCheck,a.displayText, a.isActive, b.OtherLanguageText,c.Language FROM homearticlecategory a, tbotherlanguage b , tblanguage c WHERE   a.categoryId = b.PrimaryKeyId AND b.TableId='1' AND b.LanguageId='" + Language + "' AND a.language = c.id AND a.language = '" + Language + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string DeleteCate(int id)
        {

            //
            MySqlConnection conn = new MySqlConnection(conString);
            int check = 0;
           
            var queryStr = "SELECT id from HomeArticles where HomeCategoryId=" + id + ";";

            MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            conn.Open();
            var dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                check = 1;
                conn.Close();

            }
            else
            {
                dr.Close();// Close reader.
                conn.Close();
               

                conn.Open();

                MySqlCommand cmd22 = new MySqlCommand("Delete from  homearticlecategory WHERE  id='" + id + "' ", conn);
               

                int rf = cmd22.ExecuteNonQuery();
              
                conn.Close();
                check = 2;
            }
            



            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(check);


        }

        [WebMethod()]
        public static string DeleteArticle(int id)
        {

            //
            MySqlConnection conn = new MySqlConnection(conString);
           
              
             


                conn.Open();

                MySqlCommand cmd22 = new MySqlCommand("Delete from  homearticles WHERE  id='" + id + "' ", conn);


                int rf = cmd22.ExecuteNonQuery();

                conn.Close();
               
          




            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rf);


        }

        [WebMethod()]
        public static string editCategories(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT a.id,a.language,a.orderCheck,a.categoryId,a.displayText, a.isActive, b.Category1 ,c.Language FROM homearticlecategory a, article_category b, tblanguage c  WHERE a.categoryId = b.id AND a.language = c.id AND a.id = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string editArticle(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT a.id,a.language,a.ArticleID,a.isActive, b.Title FROM homearticles a, article b  WHERE a.ArticleID = b.id  AND a.id = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string GetArticle(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT a.id,a.isActive, b.Title,c.Language FROM homearticles a, article b,tblanguage c  WHERE a.ArticleID = b.id AND a.language = c.id  AND a.HomeCategoryId = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }



        //[WebMethod()]
        //public static string UpdateCategories(int idd, int Categories, string displayText, int id, int Order, int active)
        //{

        //    MySqlConnection conn = new MySqlConnection(conString);
        //    conn.Open();

        //    if (active == 1)
        //    {
        //        string sql = ("UPDATE homearticlecategory set isActive = '0' WHERE orderCheck =  '" + Order + "'");

        //        var t = 0;

        //        using (MySqlCommand cmd1 = new MySqlCommand(sql, conn))
        //        {
        //            t = cmd1.ExecuteNonQuery();
        //        }

        //        MySqlCommand cmd3 = new MySqlCommand("UPDATE homearticlecategory set categoryId = @categoryId,displayText = @displayText,language = @language,orderCheck= @orderCheck, isActive = @Active WHERE id = '" + idd + "'", conn);


        //        MySqlParameter param4 = new MySqlParameter();
        //        param4.ParameterName = "@categoryId";
        //        param4.Value = Categories;
        //        cmd3.Parameters.Add(param4);

        //        MySqlParameter param455 = new MySqlParameter();
        //        param455.ParameterName = "@displayText";
        //        param455.Value = displayText;
        //        cmd3.Parameters.Add(param455);


        //        MySqlParameter param4555 = new MySqlParameter();
        //        param4555.ParameterName = "@language";
        //        param4555.Value = id;
        //        cmd3.Parameters.Add(param4555);

        //        MySqlParameter param45552 = new MySqlParameter();
        //        param45552.ParameterName = "@orderCheck";
        //        param45552.Value = Order;
        //        cmd3.Parameters.Add(param45552);


        //        MySqlParameter param54 = new MySqlParameter();
        //        param54.ParameterName = "@Active";
        //        param54.Value = active;
        //        cmd3.Parameters.Add(param54);

        //        t = cmd3.ExecuteNonQuery();
        //        conn.Close();
        //        return JsonConvert.SerializeObject(t);
        //    }
        //    else
        //    {
        //        var t = 0;
        //        MySqlCommand cmd3 = new MySqlCommand("UPDATE homearticlecategory set categoryId = @categoryId,displayText = @displayText,language = @language,orderCheck= @orderCheck, isActive = @Active WHERE id = '" + idd + "'", conn);


        //        MySqlParameter param4 = new MySqlParameter();
        //        param4.ParameterName = "@categoryId";
        //        param4.Value = Categories;
        //        cmd3.Parameters.Add(param4);

        //        MySqlParameter param455 = new MySqlParameter();
        //        param455.ParameterName = "@displayText";
        //        param455.Value = displayText;
        //        cmd3.Parameters.Add(param455);


        //        MySqlParameter param4555 = new MySqlParameter();
        //        param4555.ParameterName = "@language";
        //        param4555.Value = id;
        //        cmd3.Parameters.Add(param4555);

        //        MySqlParameter param45552 = new MySqlParameter();
        //        param45552.ParameterName = "@orderCheck";
        //        param45552.Value = Order;
        //        cmd3.Parameters.Add(param45552);


        //        MySqlParameter param54 = new MySqlParameter();
        //        param54.ParameterName = "@Active";
        //        param54.Value = active;
        //        cmd3.Parameters.Add(param54);

        //        t = cmd3.ExecuteNonQuery();
        //        conn.Close();
        //        return JsonConvert.SerializeObject(t);
        //    }


        //}





        [WebMethod()]
        public static string UpdateCategories(int id, int Categories, string displayText, int language, int Order, int active)
        {

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            if (active == 1)
            {
                string sql = ("UPDATE homearticlecategory set isActive = '0' WHERE orderCheck =  '" + Order + "'");

                var t = 0;

                using (MySqlCommand cmd1 = new MySqlCommand(sql, conn))
                {
                    t = cmd1.ExecuteNonQuery();
                }

                MySqlCommand cmd3 = new MySqlCommand("UPDATE homearticlecategory set categoryId = @categoryId,displayText = @displayText,language = @language,orderCheck= @orderCheck, isActive = @Active WHERE id = '" + id + "'", conn);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@categoryId";
                param4.Value = Categories;
                cmd3.Parameters.Add(param4);

                MySqlParameter param455 = new MySqlParameter();
                param455.ParameterName = "@displayText";
                param455.Value = displayText;
                cmd3.Parameters.Add(param455);


                MySqlParameter param4555 = new MySqlParameter();
                param4555.ParameterName = "@language";
                param4555.Value = language;
                cmd3.Parameters.Add(param4555);

                MySqlParameter param45552 = new MySqlParameter();
                param45552.ParameterName = "@orderCheck";
                param45552.Value = Order;
                cmd3.Parameters.Add(param45552);


                MySqlParameter param54 = new MySqlParameter();
                param54.ParameterName = "@Active";
                param54.Value = active;
                cmd3.Parameters.Add(param54);

                t = cmd3.ExecuteNonQuery();
                conn.Close();
                return JsonConvert.SerializeObject(t);
            }
            else
            {
                var t = 0;
                MySqlCommand cmd3 = new MySqlCommand("UPDATE homearticlecategory set categoryId = @categoryId,displayText = @displayText,language = @language,orderCheck= @orderCheck, isActive = @Active WHERE id = '" + id + "'", conn);


                MySqlParameter param4 = new MySqlParameter();
                param4.ParameterName = "@categoryId";
                param4.Value = Categories;
                cmd3.Parameters.Add(param4);

                MySqlParameter param455 = new MySqlParameter();
                param455.ParameterName = "@displayText";
                param455.Value = displayText;
                cmd3.Parameters.Add(param455);


                MySqlParameter param4555 = new MySqlParameter();
                param4555.ParameterName = "@language";
                param4555.Value = language;
                cmd3.Parameters.Add(param4555);

                MySqlParameter param45552 = new MySqlParameter();
                param45552.ParameterName = "@orderCheck";
                param45552.Value = Order;
                cmd3.Parameters.Add(param45552);


                MySqlParameter param54 = new MySqlParameter();
                param54.ParameterName = "@Active";
                param54.Value = active;
                cmd3.Parameters.Add(param54);

                t = cmd3.ExecuteNonQuery();
                conn.Close();
                return JsonConvert.SerializeObject(t);
            }


        }












        [WebMethod()]
        public static string UpdateArticle(int id, int Article, int active, int Language)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("UPDATE homearticles set ArticleID = @ArticleID, language = @language,isActive = @isActive WHERE id = '" + id + "'", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@ArticleID";
            param4.Value = Article;
            cmd3.Parameters.Add(param4);

            MySqlParameter param43 = new MySqlParameter();
            param43.ParameterName = "@language";
            param43.Value = Language;
            cmd3.Parameters.Add(param43);


            MySqlParameter param54 = new MySqlParameter();
            param54.ParameterName = "@isActive";
            param54.Value = active;
            cmd3.Parameters.Add(param54);



            MySqlDataReader log = cmd3.ExecuteReader();
            conn.Close();



            var rff = "ds";
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rff);



        }

        [WebMethod()]
        public static string loadArticle(int intid,int lan)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT  b.Title,b.id  FROM homearticlecategory a, article b  WHERE a.categoryId = b.ArticleCat_ID AND  a.id = '" + intid + "' AND b.languageid = '" + lan + "' AND b.isPublished ='1'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string getlangforpop(int intid)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT  b.Language,b.id  FROM homearticlecategory a, tblanguage b  WHERE a.language = b.id AND  a.id = '" + intid + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string Savearticel(int Categories, int Article, int active, int OrderID , int Language)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();
            MySqlCommand cmd3 = new MySqlCommand("Insert into  homearticles(HomeCategoryId,ArticleID,language,orderCheck,isActive) values (@HomeCategoryId,@ArticleID,@language,@order,@isActive)", conn);


            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@HomeCategoryId";
            param4.Value = Categories;
            cmd3.Parameters.Add(param4);

            MySqlParameter param54 = new MySqlParameter();
            param54.ParameterName = "@ArticleID";
            param54.Value = Article;
            cmd3.Parameters.Add(param54);

            MySqlParameter param542 = new MySqlParameter();
            param542.ParameterName = "@language";
            param542.Value = Language;
            cmd3.Parameters.Add(param542);

            MySqlParameter param5422 = new MySqlParameter();
            param5422.ParameterName = "@order";
            param5422.Value = OrderID;
            cmd3.Parameters.Add(param5422);

            MySqlParameter param544 = new MySqlParameter();
            param544.ParameterName = "@isActive";
            param544.Value = active;
            cmd3.Parameters.Add(param544);




            Int64 rf = Convert.ToInt64(cmd3.ExecuteScalar());

            conn.Close();

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rf);



        }
    }
}