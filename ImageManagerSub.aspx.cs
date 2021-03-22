using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static NewsWebsiteAdmin.SiteMaster;

namespace NewsWebsiteAdmin
{
    public partial class ImageManagerSub : System.Web.UI.Page
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
        public static string loadArticle(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article WHERE languageid = '" + id + "' AND isPublished = '1'", conn))

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
        public static string GetAllMainImg(int Language)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter("SELECT a.imagePath,a.language_Id, a.Active, a.id , b.Title,d.Language FROM tbsubimage a, article b ,tblanguage d  WHERE a.articleId = b.id AND  a.language_Id = d.id  AND a.language_Id = '" + Language + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string DeleteMainImage(int homeLid)
        {

            //
            MySqlConnection conn = new MySqlConnection(conString);

            string imgStatus = "";
            string imgName = "";
            var queryStr = "SELECT imageStatus,ImageName from tbsubimage where id=" + homeLid + ";";

            MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(queryStr, conn);
            conn.Open();
            var dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                dr.Read();
                imgStatus = dr.GetString(0);
                imgName = dr.GetString(1);
            }
            dr.Close();// Close reader.
            conn.Close();
            string path = System.Web.HttpContext.Current.Server.MapPath("SiteContent/HomeMainImage/");
            if (imgStatus == "2")
            {

                File.Delete(path + imgName + "");
            }

            conn.Open();

            MySqlCommand cmd22 = new MySqlCommand("Delete from  tbsubimage WHERE  id='" + homeLid + "' ", conn);
          

            int rf = cmd22.ExecuteNonQuery();
        

            conn.Close();



            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(rf);



        }
        [WebMethod()]
        public static string GetAllImage(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article_image where Article_ID = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string GetAllVideo(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT * FROM article_vedio where Article_ID = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }

        [WebMethod()]
        public static string EditImageMain(int id)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            conn.Open();

            using (MySqlDataAdapter a = new MySqlDataAdapter(


                "SELECT a.imagePath,a.language_Id, a.articleId, a.active, a.id , b.Title, c.Language FROM tbsubimage a, article b, tblanguage c  WHERE a.articleId = b.id AND a.language_Id = c.id AND a.id = '" + id + "'", conn))

            {
                DataTable t = new DataTable();
                a.Fill(t);
                conn.Close();

                System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
                return JsonConvert.SerializeObject(t);

            }

        }


        [WebMethod()]
        public static string updateImageSec(int id, int Language,int article, int active)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            int count = 0;
            int error = 0;
            if (active == 1)
            {
                conn.Open();
                using (var cmd = new MySqlCommand("SELECT COUNT(*) FROM tbsubimage WHERE  language_Id ='" + Language + "' AND active = '1' ", conn))
                {
                    count = Convert.ToInt32(cmd.ExecuteScalar());

                }
                conn.Close();
                if (count >= 3)
                {
                    error = 404;
                }
                else
                {
                    conn.Open();
                    MySqlCommand cmd3 = new MySqlCommand("UPDATE tbsubimage set articleId = @articleId, active = @Active WHERE id = '" + id + "'", conn);


                    MySqlParameter param4 = new MySqlParameter();
                    param4.ParameterName = "@articleId";
                    param4.Value = article;
                    cmd3.Parameters.Add(param4);

                    MySqlParameter param54 = new MySqlParameter();
                    param54.ParameterName = "@Active";
                    param54.Value = active;
                    cmd3.Parameters.Add(param54);



                    MySqlDataReader log = cmd3.ExecuteReader();
                    conn.Close();

                   
                }

            }
            else
            {
                conn.Open();
                MySqlCommand cmd34 = new MySqlCommand("UPDATE tbsubimage set articleId = @articleId, active = @Active WHERE id = '" + id + "'", conn);


                MySqlParameter param45 = new MySqlParameter();
                param45.ParameterName = "@articleId";
                param45.Value = article;
                cmd34.Parameters.Add(param45);

                MySqlParameter param554 = new MySqlParameter();
                param554.ParameterName = "@Active";
                param554.Value = active;
                cmd34.Parameters.Add(param554);



                MySqlDataReader log1 = cmd34.ExecuteReader();
                conn.Close();

               

            }

               
           


           
            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(error);



        }

        [WebMethod()]
        public static string saveNewImage(string Image_path, int Language, int article, int active)
        {
            MySqlConnection conn = new MySqlConnection(conString);
            int count = 0;
            int error = 0;
            if (active == 1)
            {
                conn.Open();
                using (var cmd = new MySqlCommand("SELECT COUNT(*) FROM tbsubimage  WHERE   language_Id ='" + Language + "' AND active = '1' ", conn))
                {
                    count = Convert.ToInt32(cmd.ExecuteScalar());

                }
                conn.Close();
                if (count >= 3)
                {
                    error = 404;
                }
                else
                {
                    string t = "fds";
                    string dateTimeKey = DateTime.Now.ToString("yyyyMMddHHmmss");
                    string base64 = Image_path.Split(',')[1];
                    byte[] bytes = Convert.FromBase64String(base64);
                    string path = System.Web.HttpContext.Current.Server.MapPath("SiteContent/HomeMainImage/");
                    using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                    {

                        image.Save(path + dateTimeKey + ".jpg", ImageFormat.Jpeg);// Or Png


                    }

                    string ImgPath = "SiteContent/HomeMainImage/" + dateTimeKey + ".jpg";




                 

                    string ImgName = "" + dateTimeKey + ".jpg";
                    conn.Open();
                    MySqlCommand cmd4 = new MySqlCommand("Insert into  tbsubimage(language_Id,imagePath,ImageName,imageStatus,articleId,active) values (@language_Id,@imagePath,@ImageName,@imageStatus,@articleId,@Active)", conn);


                    MySqlParameter param5 = new MySqlParameter();
                    param5.ParameterName = "@language_Id";
                    param5.Value = Language;
                    cmd4.Parameters.Add(param5);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@imagePath";
                    param6.Value = ImgPath;
                    cmd4.Parameters.Add(param6);

                    MySqlParameter param66 = new MySqlParameter();
                    param66.ParameterName = "@ImageName";
                    param66.Value = ImgName;
                    cmd4.Parameters.Add(param66);

                    MySqlParameter param6r = new MySqlParameter();
                    param6r.ParameterName = "@imageStatus";
                    param6r.Value = 2;
                    cmd4.Parameters.Add(param6r);

                    MySqlParameter param7 = new MySqlParameter();
                    param7.ParameterName = "@articleId";
                    param7.Value = article;
                    cmd4.Parameters.Add(param7);

                    MySqlParameter param8 = new MySqlParameter();
                    param8.ParameterName = "@Active";
                    param8.Value = active;
                    cmd4.Parameters.Add(param8);




                    int rff = cmd4.ExecuteNonQuery();
                    error = 0;

                    conn.Close();
                }

            }
            else
            {
                string t = "fds";
                string dateTimeKey = DateTime.Now.ToString("yyyyMMddHHmmss");
                string base64 = Image_path.Split(',')[1];
                byte[] bytes = Convert.FromBase64String(base64);
                string path = System.Web.HttpContext.Current.Server.MapPath("SiteContent/HomeMainImage/");
                using (System.Drawing.Image image = System.Drawing.Image.FromStream(new MemoryStream(bytes)))
                {

                    image.Save(path + dateTimeKey + ".jpg", ImageFormat.Jpeg);// Or Png


                }

                string ImgPath = "SiteContent/HomeMainImage/" + dateTimeKey + ".jpg";




              

                string ImgName = "" + dateTimeKey + ".jpg";
                conn.Open();
                MySqlCommand cmd4 = new MySqlCommand("Insert into  tbsubimage(language_Id,imagePath,ImageName,imageStatus,articleId,active) values (@language_Id,@imagePath,@ImageName,@imageStatus,@articleId,@Active)", conn);


                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@language_Id";
                param5.Value = Language;
                cmd4.Parameters.Add(param5);

                MySqlParameter param6 = new MySqlParameter();
                param6.ParameterName = "@imagePath";
                param6.Value = ImgPath;
                cmd4.Parameters.Add(param6);

                MySqlParameter param66 = new MySqlParameter();
                param66.ParameterName = "@ImageName";
                param66.Value = ImgName;
                cmd4.Parameters.Add(param66);

                MySqlParameter param6r = new MySqlParameter();
                param6r.ParameterName = "@imageStatus";
                param6r.Value = 2;
                cmd4.Parameters.Add(param6r);

                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@articleId";
                param7.Value = article;
                cmd4.Parameters.Add(param7);

                MySqlParameter param8 = new MySqlParameter();
                param8.ParameterName = "@Active";
                param8.Value = active;
                cmd4.Parameters.Add(param8);




                int rff = cmd4.ExecuteNonQuery();
                error = 0;

                conn.Close();
            }

               

            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(error);



        }


        [WebMethod()]
        public static string AddExsitingImageMain(string imgparth, int Language, int article, int active)
        {
            string Path = imgparth.Remove(0, 8);
            int count = 0;
            int error = 0;
            MySqlConnection conn = new MySqlConnection(conString);
            if (active == 1)
            {
                conn.Open();
                using (var cmd = new MySqlCommand("SELECT COUNT(*) FROM tbsubimage  WHERE   language_Id ='" + Language + "' AND active = '1' ", conn))
                {
                    count = Convert.ToInt32(cmd.ExecuteScalar());

                }
                conn.Close();
                if (count >= 3)
                {
                    error = 404;
                }
                else
                {

                    


                    conn.Open();

                    MySqlCommand cmd4 = new MySqlCommand("Insert into  tbsubimage(language_Id,imagePath,imageStatus,articleId,active) values (@language_Id,@imagePath,@imageStatus,@articleId,@active)", conn);


                    MySqlParameter param5 = new MySqlParameter();
                    param5.ParameterName = "@language_Id";
                    param5.Value = Language;
                    cmd4.Parameters.Add(param5);

                    MySqlParameter param6 = new MySqlParameter();
                    param6.ParameterName = "@imagePath";
                    param6.Value = Path;
                    cmd4.Parameters.Add(param6);

                    MySqlParameter param6r = new MySqlParameter();
                    param6r.ParameterName = "@imageStatus";
                    param6r.Value = 1;
                    cmd4.Parameters.Add(param6r);

                    MySqlParameter param7 = new MySqlParameter();
                    param7.ParameterName = "@articleId";
                    param7.Value = article;
                    cmd4.Parameters.Add(param7);

                    MySqlParameter param8 = new MySqlParameter();
                    param8.ParameterName = "@active";
                    param8.Value = active;
                    cmd4.Parameters.Add(param8);




                    int rff = cmd4.ExecuteNonQuery();


                    conn.Close();

                    error = 0;




                }
            }
            else
            {
               


                conn.Open();

                MySqlCommand cmd4 = new MySqlCommand("Insert into  tbsubimage(language_Id,imagePath,imageStatus,articleId,active) values (@language_Id,@imagePath,@imageStatus,@articleId,@active)", conn);


                MySqlParameter param5 = new MySqlParameter();
                param5.ParameterName = "@language_Id";
                param5.Value = Language;
                cmd4.Parameters.Add(param5);

                MySqlParameter param6 = new MySqlParameter();
                param6.ParameterName = "@imagePath";
                param6.Value = Path;
                cmd4.Parameters.Add(param6);

                MySqlParameter param6r = new MySqlParameter();
                param6r.ParameterName = "@imageStatus";
                param6r.Value = 1;
                cmd4.Parameters.Add(param6r);

                MySqlParameter param7 = new MySqlParameter();
                param7.ParameterName = "@articleId";
                param7.Value = article;
                cmd4.Parameters.Add(param7);

                MySqlParameter param8 = new MySqlParameter();
                param8.ParameterName = "@active";
                param8.Value = active;
                cmd4.Parameters.Add(param8);




                int rff = cmd4.ExecuteNonQuery();


                conn.Close();

                error = 0;
            }
           
           


            System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
            return JsonConvert.SerializeObject(error);


        }
    }
}