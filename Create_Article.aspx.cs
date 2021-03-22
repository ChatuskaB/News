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
using System.IO;
using System.Drawing.Imaging;
using System.Collections;

namespace NewsWebsiteAdmin
{
    public partial class Create_Article : System.Web.UI.Page
    {

        static string conString = ConfigurationManager.AppSettings["ConString"];
        static int authorid;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        [WebMethod(EnableSession = true)]
        public static string SaveArticle(string Location, string CreatedDate, string Category1, string SubCategory1, string Title, String Content, string Article_Summery, String Image_path, String Image_path_2, String Image_path_3, String Image_path_4, string Template_ID, string Article_Url_Title, int languageid)


        {
           
            Hashtable user = (Hashtable)HttpContext.Current.Session["user"];

            int UserLoginId = (int)user["Id"];
            

            MySqlConnection connection = new MySqlConnection(conString);
            connection.Open();

            string sql = "SELECT id FROM author where User_ID='"+ UserLoginId +"' ";
            MySqlCommand getauthorid = new MySqlCommand(sql, connection);
            
            MySqlDataReader rdr = getauthorid.ExecuteReader();

            while (rdr.Read())
            {
                authorid = rdr.GetInt32(0);
            }
            rdr.Close();
            connection.Close();

            string datetimenow = DateTime.Now.ToString("yyyyMMddHHmmss");
            string ImgPath;
            string ImgPath2;
            string ImgPath3;
            string ImgPath4;
            
            if (Image_path.Length > 500) { 
            
                string base64 = Image_path.Split(',')[1];
                byte[] bytes = Convert.FromBase64String(base64);
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                {
                    image.Save(CommanClass.adminpath + "SiteContent/Article_Pictures/" + datetimenow + "1.jpg", ImageFormat.Jpeg);// Or Png
                }
                 ImgPath = "SiteContent/Article_Pictures/" + datetimenow + "1.jpg";

            }
            else
            {
                 ImgPath = Image_path;
            }


            if (Image_path_2 != null && Image_path_2.Length > 500) {

                string base642 = Image_path_2.Split(',')[1];
                byte[] bytes2 = Convert.FromBase64String(base642);
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes2)))
                {
                    image.Save(CommanClass.adminpath + "SiteContent/Article_Pictures/" + datetimenow + "2.jpg", ImageFormat.Jpeg);// Or Png
                }
                 ImgPath2 = "SiteContent/Article_Pictures/" + datetimenow + "2.jpg";

            }
            else {
                 ImgPath2 = Image_path_2;
            }


            if (Image_path_3 != null && Image_path_3.Length > 500)
            {
                string base643 = Image_path_3.Split(',')[1];
                byte[] bytes3 = Convert.FromBase64String(base643);
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes3)))
                {
                    image.Save(CommanClass.adminpath + "SiteContent/Article_Pictures/" + datetimenow + "3.jpg", ImageFormat.Jpeg);// Or Png
                }
                 ImgPath3 = "SiteContent/Article_Pictures/" + datetimenow + "3.jpg";
            }
            else
            {
                 ImgPath3 = Image_path_3;
            }

            if (Image_path_3 != null && Image_path_4.Length > 500)
            {
                string base644 = Image_path_4.Split(',')[1];
                byte[] bytes4 = Convert.FromBase64String(base644);
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes4)))
                {
                    image.Save(CommanClass.adminpath + "SiteContent/Article_Pictures/" + DateTime.Now.ToString("yyyyMMddHHmmss") + "4.jpg", ImageFormat.Jpeg);// Or Png
                }
                 ImgPath4 = "SiteContent/Article_Pictures/" + datetimenow + "4.jpg";
            }
            else
            {
                 ImgPath4 = Image_path_4;
            }

            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();


            MySqlCommand cmd2 = new MySqlCommand("Insert into  article(CreatedDate,Title,Content,Article_Summery,ArticleCat_ID,ArticleSubCat_ID,Template_ID,isPublished,languageid,Article_Url_Title,Author_id,Location) values (@pCreatedDate,@pTitle,@pCont,@pSummery,@pCategory1,@pSubCategory1,@pTemplate_ID,0,@planguageid,@pArticle_Url_Title,@pAuthor_id,@pLocation); Select LAST_INSERT_ID()", conn);

            MySqlParameter param17 = new MySqlParameter();
            param17.ParameterName = "@pLocation";
            param17.Value = Location;
            cmd2.Parameters.Add(param17);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pTitle";
            param5.Value = Title;
            cmd2.Parameters.Add(param5);

            MySqlParameter param15 = new MySqlParameter();
            param15.ParameterName = "@pArticle_Url_Title";
            param15.Value = Article_Url_Title;
            cmd2.Parameters.Add(param15);

            MySqlParameter param16 = new MySqlParameter();
            param16.ParameterName = "@pAuthor_id";
            param16.Value = authorid;
            cmd2.Parameters.Add(param16);

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@pCont";
            param7.Value = Content;
            cmd2.Parameters.Add(param7);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@pSummery";
            param6.Value = Article_Summery;
            cmd2.Parameters.Add(param6);

            MySqlParameter param10 = new MySqlParameter();
            param10.ParameterName = "@pCreatedDate";
            param10.Value = CreatedDate;
            cmd2.Parameters.Add(param10);

            MySqlParameter param12 = new MySqlParameter();
            param12.ParameterName = "@pSubCategory1";
            param12.Value = SubCategory1;
            cmd2.Parameters.Add(param12);

            MySqlParameter param13 = new MySqlParameter();
            param13.ParameterName = "@pTemplate_ID";
            param13.Value = Template_ID;
            cmd2.Parameters.Add(param13);

            MySqlParameter param14 = new MySqlParameter();
            param14.ParameterName = "@planguageid";
            param14.Value = languageid;
            cmd2.Parameters.Add(param14);

            MySqlParameter param11 = new MySqlParameter();
            param11.ParameterName = "@pCategory1";
            param11.Value = Category1;
            cmd2.Parameters.Add(param11);

            Int64 rf = Convert.ToInt64(cmd2.ExecuteScalar());
            
            MySqlCommand cmd3 = new MySqlCommand("Insert into  article_image(Article_ID,Image_path,Image_path_2,Image_path_3,Image_path_4) values (" + rf + ",@Imgpath,@Imgpath2,@Imgpath3,@Imgpath4);", conn);
            
            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@Imgpath";
            param4.Value = ImgPath;
            cmd3.Parameters.Add(param4);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@Imgpath2";
            param1.Value = ImgPath2;
            cmd3.Parameters.Add(param1);

            MySqlParameter param9 = new MySqlParameter();
            param9.ParameterName = "@Imgpath3";
            param9.Value = ImgPath3;
            cmd3.Parameters.Add(param9);

            MySqlParameter param3 = new MySqlParameter();
            param3.ParameterName = "@Imgpath4";
            param3.Value = ImgPath4;
            cmd3.Parameters.Add(param3);
            

            int rff = cmd3.ExecuteNonQuery();
            conn.Close();

            var data = new { status = (rf > 0) };
          
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);

           
        }



        [WebMethod(EnableSession = true)]
        public static string SaveVideoArticle(string Location, string CreatedDate, string Category1, string SubCategory1, string Title, String Content, string Article_Summery, String Vedio_path, String videothumb, string Template_ID, string Article_Url_Title, int languageid)


        {

            Hashtable user = (Hashtable)HttpContext.Current.Session["user"];

            int UserLoginId = (int)user["Id"];


            MySqlConnection connection = new MySqlConnection(conString);
            connection.Open();

            string sql = "SELECT id FROM author where User_ID='" + UserLoginId + "' ";
            MySqlCommand getauthorid = new MySqlCommand(sql, connection);

            MySqlDataReader rdr = getauthorid.ExecuteReader();

            while (rdr.Read())
            {
                authorid = rdr.GetInt32(0);
            }
            rdr.Close();
            connection.Close();

            string datetimenow = DateTime.Now.ToString("yyyyMMddHHmmss");
            string ImgPath;
          
                string base642 = videothumb.Split(',')[1];
                byte[] bytes2 = Convert.FromBase64String(base642);
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes2)))
                {
                    image.Save(CommanClass.adminpath + "SiteContent/Article_Videos/" + datetimenow + ".jpg", ImageFormat.Jpeg);// Or Png
                }
                ImgPath = "SiteContent/Article_Videos/" + datetimenow + ".jpg";
            
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();


            MySqlCommand cmd2 = new MySqlCommand("Insert into  article(CreatedDate,Title,Content,Article_Summery,ArticleCat_ID,ArticleSubCat_ID,Template_ID,isPublished,languageid,Article_Url_Title,Author_id,Location) values (@pCreatedDate,@pTitle,@pCont,@pSummery,@pCategory1,@pSubCategory1,@pTemplate_ID,0,@planguageid,@pArticle_Url_Title,@pAuthor_id,@pLocation); Select LAST_INSERT_ID()", conn);

            MySqlParameter param17 = new MySqlParameter();
            param17.ParameterName = "@pLocation";
            param17.Value = Location;
            cmd2.Parameters.Add(param17);

            MySqlParameter param5 = new MySqlParameter();
            param5.ParameterName = "@pTitle";
            param5.Value = Title;
            cmd2.Parameters.Add(param5);

            MySqlParameter param15 = new MySqlParameter();
            param15.ParameterName = "@pArticle_Url_Title";
            param15.Value = Article_Url_Title;
            cmd2.Parameters.Add(param15);

            MySqlParameter param16 = new MySqlParameter();
            param16.ParameterName = "@pAuthor_id";
            param16.Value = authorid;
            cmd2.Parameters.Add(param16);

            MySqlParameter param7 = new MySqlParameter();
            param7.ParameterName = "@pCont";
            param7.Value = Content;
            cmd2.Parameters.Add(param7);

            MySqlParameter param6 = new MySqlParameter();
            param6.ParameterName = "@pSummery";
            param6.Value = Article_Summery;
            cmd2.Parameters.Add(param6);

            MySqlParameter param10 = new MySqlParameter();
            param10.ParameterName = "@pCreatedDate";
            param10.Value = CreatedDate;
            cmd2.Parameters.Add(param10);

            MySqlParameter param12 = new MySqlParameter();
            param12.ParameterName = "@pSubCategory1";
            param12.Value = SubCategory1;
            cmd2.Parameters.Add(param12);

            MySqlParameter param13 = new MySqlParameter();
            param13.ParameterName = "@pTemplate_ID";
            param13.Value = Template_ID;
            cmd2.Parameters.Add(param13);

            MySqlParameter param14 = new MySqlParameter();
            param14.ParameterName = "@planguageid";
            param14.Value = languageid;
            cmd2.Parameters.Add(param14);

            MySqlParameter param11 = new MySqlParameter();
            param11.ParameterName = "@pCategory1";
            param11.Value = Category1;
            cmd2.Parameters.Add(param11);

            Int64 rf = Convert.ToInt64(cmd2.ExecuteScalar());

            MySqlCommand cmd3 = new MySqlCommand("Insert into  article_vedio(Article_ID,videothumb,Vedio_path) values (" + rf + ",@videothumb,@Vedio_path);", conn);

            MySqlParameter param4 = new MySqlParameter();
            param4.ParameterName = "@videothumb";
            param4.Value = ImgPath;
            cmd3.Parameters.Add(param4);

            MySqlParameter param1 = new MySqlParameter();
            param1.ParameterName = "@Vedio_path";
            param1.Value = Vedio_path;
            cmd3.Parameters.Add(param1);
            
            int rff = cmd3.ExecuteNonQuery();
            conn.Close();

            var data = new { status = (rf > 0) };

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return js.Serialize(data);


        }



        [WebMethod()]
        public static string LoadSubCategories(int id, int catid)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT tbotherlanguage.PrimaryKeyId as subcatid, tbotherlanguage.OtherLanguageText FROM article_subcategory INNER JOIN tbotherlanguage ON  article_subcategory.id = tbotherlanguage.PrimaryKeyId INNER JOIN article_category ON article_subcategory.ArticleCat_ID = article_category.id WHERE tbotherlanguage.TableId = '2' AND article_subcategory.ArticleCat_ID='" + catid + "' AND tbotherlanguage.LanguageId='" +id+ "' ", conn))

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